Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17122EBB63
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DBA89D81;
	Wed,  6 Jan 2021 08:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAFB6E077
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 20:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=qA9BU8HaFo0a9vJcnVVWjH72JR8Hikgs6SJAj6tITNk=; b=grDSenLtnhXnDoxe9CPaBsTTqa
 hyV0MQBUhmv7g5fEqBfms+SyjkTbTGAx3GaMtr7615NcF+E45GTtmJ5YT5aF9DqLdhkXAeKOHPxcH
 tkRf/WxQcV9cvnpqQgdSVKkfhAUuLwj8ysunioCeq1ou8YpkEczlTUoAxSoTSoNeP9EtLHQHubr4H
 mJKtBoN7eWZC9AgGgICLEUXlpSbM04cv2xhwz+riMGYdfCozcrh55N683yDf9ViOleHVZGhPXd92I
 NklGHlPMbKWixEKMlQlS8KulEXELa8UUjvoKDdpxBlvWc6zB3jxxa+OrjQ0A0ErrQBezg6jjCvM4T
 vpCFSV/g==;
Received: from [2601:1c0:6280:3f0::64ea]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwscJ-0003Ku-TR; Tue, 05 Jan 2021 20:07:44 +0000
Subject: Re: [PATCH] drm/agpsupport: Fix warning in functions documentation
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
References: <20210105123905.90330-1-benjamin.gaignard@collabora.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <24a3b8de-495c-2c85-c6fe-5a3be813e62b@infradead.org>
Date: Tue, 5 Jan 2021 12:07:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210105123905.90330-1-benjamin.gaignard@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/21 4:39 AM, Benjamin Gaignard wrote:
> Fix the warnings reported in functions documentation when compiling with W=1
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/gpu/drm/drm_agpsupport.c | 111 ++++++++++++++++---------------
>  1 file changed, 59 insertions(+), 52 deletions(-)
> 

LGTM. Thanks.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
