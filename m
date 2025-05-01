Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F847AA5C84
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 11:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D9110E341;
	Thu,  1 May 2025 09:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="Xi3ULj+M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B9F10E341
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 09:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746090691; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=k7HjUvxDid3JsU/QkBpIBvxg5wDPaI1ZDaoTPFQw+7jYxjtgn3+QPmy+G18X9A3X01qNNadOanm36PHH0p0SfrxvMQGgqAgC0iLMDwxx3Xf34PqtflLxpKm9ZViNplPvI/2/gCT1gqhUCDFeR665kEQvY7tFDkEhpPCMebZ1k0M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746090691;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=N9n+ERiGGveVUdqEmbAiHxR0YVwJjs2BtWqO6AWPiu0=; 
 b=OelDws50IcnI6USc+8J7xIQ8mZUWdzZU8a1Wl+cZWDOEdjyol2ScMtVTq5Lp5CqXNoPOqpNzq/RDL1rSiVc0HJhMZGJJEFmCsP9UF9bStkYSlJKzTnT0ywMkr774aFGjMlWED28c5rbOcIWGqIFUIulJp04VvyM3PcCJyrImsRM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746090691; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=N9n+ERiGGveVUdqEmbAiHxR0YVwJjs2BtWqO6AWPiu0=;
 b=Xi3ULj+M4B5LtuiIN0lZ/NI/8ArSM//4ounDafnNj6tbR1JqscX2JY64Qq5xu2lT
 YRqKkToao29DmAoEAIOUA+8zTYhzINiGObxvzcKQ1z+VdyeqwjxJc3+OrpcvRwmjG55
 MLzIaGwk/30RKMnVSh6bbOQNzzfjzXHBycbnUTd4=
Received: by mx.zohomail.com with SMTPS id 174609068908666.27584482954603;
 Thu, 1 May 2025 02:11:29 -0700 (PDT)
Message-ID: <da032c0c-b0d1-4250-b86f-acc0f13bf037@collabora.com>
Date: Thu, 1 May 2025 11:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: drm_fourcc: add 10/12bit software decoder YCbCr
 formats
To: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20250407191314.500601-1-robert.mader@collabora.com>
 <dde3c5c3-4e23-4962-a165-38fa6b004ef1@collabora.com>
 <87plgvz1k7.fsf@minerva.mail-host-address-is-not-set>
Content-Language: en-US, de-DE, en-GB
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <87plgvz1k7.fsf@minerva.mail-host-address-is-not-set>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Javier, thanks for the reply anyway. FTR., the formats are very 
similar to DRM_FORMAT_Q410, just with different alignment.

On 29.04.25 12:47, Javier Martinez Canillas wrote:
> Robert Mader <robert.mader@collabora.com> writes:
>
> Hello Robert,
>
>> Chris, Javier, Laurent - sorry for the noise, but given you reviewed
>> changes in the respective files before, maybe you can help me moving
>
> I'm not familiar with these formats to do a proper review. Sorry about that...
>
