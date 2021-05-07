Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313ED3767BA
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 17:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371DB6EE65;
	Fri,  7 May 2021 15:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803146EE64;
 Fri,  7 May 2021 15:11:56 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id w3so14149351ejc.4;
 Fri, 07 May 2021 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=rV53itOHOPDBfPsduvSVds3hH48mJoSo30AjaIguioo=;
 b=ZMWKS3Sltz2v9tFwmWeNdVJ3TAKEpOeV8O+SCUqQz8qk9lPGYt/ySSTtDk1tITccFO
 vvDmp/NpS2tB30PhoW2AvsCemZoi4sv5DlUaCzvHmDahbFsKfzXOwNs1N+Ke37HmEbTj
 XM9oGuidCR7oCEepRJdC8f+nf6MCbXRgMsAE9adtTQ6lsX1vRVv+Q2TB/MJS1To2raeG
 rvC5CWxTPCnUGgq8ipmcPMKZZhMzI3+Vu3544AMn3K2lG+rHOU93hhbLnG/leJZNp2h6
 6A0mNWyrOvDw03poixIUXCHf0N6bNkaSa380Jt/wUzVoMr5Vrkvi9pWgwY6bY0QHVLSb
 c5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=rV53itOHOPDBfPsduvSVds3hH48mJoSo30AjaIguioo=;
 b=YcmmfR2RI7O6e4iDSbvl9r9LdSvzUwqWG3cOkzh3jak+thf6jduvSz9ej8IjxVfv+f
 iknVsxlfosOsegy6OX98N0XFdk7/JjuhYoP+L13yVtsL/7G3wcPhSL5EDpzK3Aae1v+S
 9xBSer//7poHbK9SDD/hD86wRf/dXOrMj2wNZOaJdYBAPSH7AogH3Dzi2c55HmDAtOsj
 lndC3cIcvd4HjdP8Xzto8V4TPxopiPas2sgNOkxAnLCM5qu28w9zaujtrs1Z7g/I4GyK
 3Fkz7nxDjXWN8MicbSTEKOfqk/Ev+WnoJHxAJzAhFiqruRYMsEjDvAJ65YKbcwXSOCKl
 t3/Q==
X-Gm-Message-State: AOAM530sf0jcx5pViEfRftBtjDoiBXjXz6JD0+pWjr6O62diKyZCqLxh
 8gzgT3JQZjyyGEA1Ej7pk2+vR5mhS3c=
X-Google-Smtp-Source: ABdhPJxZFqOyIo7RPQPxn1qQu9cb8PAmbHwnct4jU/X8KUfJlY86Z5+FcC3ApSS8XAebI1JNAHZ14w==
X-Received: by 2002:a17:906:f8d9:: with SMTP id
 lh25mr10585877ejb.88.1620400315186; 
 Fri, 07 May 2021 08:11:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:a0e9:d905:7efe:322d?
 ([2a02:908:1252:fb60:a0e9:d905:7efe:322d])
 by smtp.gmail.com with ESMTPSA id z22sm5060286edm.57.2021.05.07.08.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 08:11:54 -0700 (PDT)
Subject: Re: [5.12 regression] ttm->pages NULL dereference with radeon driver
To: Takashi Iwai <tiwai@suse.de>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <s5ho8dmh98p.wl-tiwai@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <aa54b1d7-1d3c-4c77-37db-d6c93b8c794c@gmail.com>
Date: Fri, 7 May 2021 17:11:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5ho8dmh98p.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Takashi,

Am 07.05.21 um 17:08 schrieb Takashi Iwai:
> Hi,
>
> we've received a regression report showing NULL dereference Oops with
> radeon driver on 5.12 kernel:
>    https://bugzilla.opensuse.org/show_bug.cgi?id=1185516
>
> It turned out that the recent TTM cleanup / refactoring via commit
> 0575ff3d33cd ("drm/radeon: stop using pages with
> drm_prime_sg_to_page_addr_arrays v2") is the culprit.  On 5.12 kernel,
> ttm->pages is no longer allocated / set up, while the radeon driver
> still has a few places assuming the valid ttm->pages, and for the
> reporter (running the modesettig driver), radeon_gart_bind() hits the
> problem.
>
> A hackish patch below was confirmed to work, at least, but obviously
> we need a proper fix.
>
> Could you take a look at it?

If that's all then that looks trivial to me.

Going to provide a patch on Monday.

Thanks for the notice,
Christian.

>
>
> thanks,
>
> Takashi
>
> --- a/drivers/gpu/drm/radeon/radeon_gart.c
> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> @@ -253,7 +253,7 @@ void radeon_gart_unbind(struct radeon_de
>   	t = offset / RADEON_GPU_PAGE_SIZE;
>   	p = t / (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
>   	for (i = 0; i < pages; i++, p++) {
> -		if (rdev->gart.pages[p]) {
> +		if (1 /*rdev->gart.pages[p]*/) {
>   			rdev->gart.pages[p] = NULL;
>   			for (j = 0; j < (PAGE_SIZE / RADEON_GPU_PAGE_SIZE); j++, t++) {
>   				rdev->gart.pages_entry[t] = rdev->dummy_page.entry;
> @@ -301,7 +301,7 @@ int radeon_gart_bind(struct radeon_devic
>   	p = t / (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
>   
>   	for (i = 0; i < pages; i++, p++) {
> -		rdev->gart.pages[p] = pagelist[i];
> +		/* rdev->gart.pages[p] = pagelist[i]; */
>   		page_base = dma_addr[i];
>   		for (j = 0; j < (PAGE_SIZE / RADEON_GPU_PAGE_SIZE); j++, t++) {
>   			page_entry = radeon_gart_get_page_entry(page_base, flags);
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -360,6 +360,8 @@ static int radeon_ttm_tt_pin_userptr(str
>   
>   	if (current->mm != gtt->usermm)
>   		return -EPERM;
> +	if (!ttm->pages)
> +		return -EPERM;
>   
>   	if (gtt->userflags & RADEON_GEM_USERPTR_ANONONLY) {
>   		/* check that we only pin down anonymous memory
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

