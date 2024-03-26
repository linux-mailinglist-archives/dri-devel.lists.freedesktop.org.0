Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE14788CB75
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 19:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6027F10F1BD;
	Tue, 26 Mar 2024 18:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XPKjlYpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9868010F1BB;
 Tue, 26 Mar 2024 18:02:11 +0000 (UTC)
Received: from [192.168.42.20] (p5de45f8b.dip0.t-ipconnect.de [93.228.95.139])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D04272FC0064;
 Tue, 26 Mar 2024 19:02:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1711476129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67Lg4wuP6h7ErjyOCsUYv2VB5WjsY82ObZUF8rzV50g=;
 b=XPKjlYpvPbqUpi88uV2wr1ItI6D0wKIhnkXw2a619zBAzqgKzuURmVi+jvSlQ+eiEp3QjS
 D/fzS7dnH5u0+qx9wAa0Pq2YL28B82U9gfexZYmapsZnEc+ArKxwuNw2SK3ygdSOeyma1b
 zuSizs8BduXHBni3Z5lqFVSpRsx9Llo=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <a1ea4750-ce15-4cf9-bce0-e013e89ebac2@tuxedocomputers.com>
Date: Tue, 26 Mar 2024 19:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Library and interfaces for GPU offloading
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
To: mesa-dev@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <be4dc7e4-2b28-4c9f-a97b-6a2e8ca3a8b6@tuxedocomputers.com>
In-Reply-To: <be4dc7e4-2b28-4c9f-a97b-6a2e8ca3a8b6@tuxedocomputers.com>
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

Am 25.03.24 um 11:41 schrieb Werner Sembach:
> Hello everyone,
>
> currently GPU offloading on Linux is handled via environment variables. Which 
> is a subpar experience for desktop files and might not be possible when using 
> launchers (i.e. Steam, Lutris, Heroic, etc.) that have no explicit support for 
> it without running the whole launcher permanently on the dGPU.
>
> A proof of concept for a better solution is posted here: 
> https://gitlab.freedesktop.org/glvnd/libglvnd/-/merge_requests/224 + 
> https://gitlab.freedesktop.org/glvnd/libglvnd/-/merge_requests/228 , but it's 
> stale since 3 years so I wanted to make a push for it.
>
> Is there currently active work on this?
>
> What is Mesas take on on the PoCs? 
> https://gitlab.freedesktop.org/glvnd/libglvnd/-/merge_requests/228#note_1364162
>
> Best regards,
>
> Werner Sembach
>
I was pointed to dri-devel with this to find the correct people.

Best Regards,

Werner Sembach

