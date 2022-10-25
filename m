Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66160DBBB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 09:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B792610E469;
	Wed, 26 Oct 2022 07:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4FC10E156;
 Tue, 25 Oct 2022 20:02:30 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so6044058pjk.2; 
 Tue, 25 Oct 2022 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sCSHnie7nbI2FMBFICWqa0omK7VXIgSVZ2dIjG4CBuc=;
 b=aDA7BbR3Ja4cnhevsaBBMfimo/Tqn1gci6sqSUsju2slvTnC1KiNQk9xbZU3gEbdtG
 qI9TpPQQtOxqFWJtSTb3KS8KmocPMKQxjmPQJj59Ulz12ko+3fQFa4taFNfv47qsFZtn
 xF0RUcQ5abUG6fzu5mZ6ezoTn1NEYPmsiKvKdWsW2CRmXdryNnNbkKWd8X20GXv+tq3m
 9IEAc7JzIJICO2ywwtKdaB5Bhw9VSiwWdG/fmlwBQIp+03eAJbpjMKgPQvQSEnnOHY+n
 SbcittWfXdXLk8G9hBut0LT3uIaCaqJ2/Z1/3iigRuYIHx/Of5Ow5GAJVZvZeaXJdDPS
 9klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sCSHnie7nbI2FMBFICWqa0omK7VXIgSVZ2dIjG4CBuc=;
 b=Q9u/bYzR24pJdPE6UFY5TReyBuyCW09YDurDYiEkRoC8GprugtVk8QImkszgMbOvnn
 2VKsrs4t8hwq7wxf392BWj5oonK7WN8Taiq/Tl4fs100wRSUwzm9EaysmhpLmRLWf1JY
 3KxWKI9vHkiXSIW9K5B6EcxxSE21Up9lI79nQr7EXwXYGNHL38CO3yzdMXgLC+CnlUPT
 /QRXhuKCnUdhXD1THONd5sVUcZr2yuw61PX2WbucrXQ4rj9hCIjecEmWfU9W1/pbRy6Y
 w3cwi5MF7HrBlwTmfPxjBcuDvYU3RVPTQ1TES7GalC0Vp1dg4VsMrH8TIhCa9o9ofXoJ
 dIbg==
X-Gm-Message-State: ACrzQf12xgGMHzw44zfxlz92mZh5Qeb0SdXxJvo4U5qV2Yvl39H+yjmP
 DOSKR71TA9AyMQAAo9/iNS8=
X-Google-Smtp-Source: AMsMyM7VHjIa+QWIXmuv84bgv56y/nQYtKVdDumpW7B1YOYtnW8N1UD6p4iJ0qgiSeDw4z4Z88LBTw==
X-Received: by 2002:a17:902:db09:b0:184:ba4f:af28 with SMTP id
 m9-20020a170902db0900b00184ba4faf28mr39823489plx.145.1666728150208; 
 Tue, 25 Oct 2022 13:02:30 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 i12-20020a056a00004c00b0056bd737fdf3sm1743129pfk.123.2022.10.25.13.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 13:02:29 -0700 (PDT)
Date: Wed, 26 Oct 2022 09:02:22 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH] [next] amdkfd: remove unused kfd_pm4_headers_diq header
 file
Message-ID: <Y1hAzn9zXhQYj1NL@mail.google.com>
References: <Y1eoYDDZWdyLNlBc@mail.google.com>
 <f2b6f0e1-1ae0-21ec-372e-6e90827ccea6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2b6f0e1-1ae0-21ec-372e-6e90827ccea6@amd.com>
X-Mailman-Approved-At: Wed, 26 Oct 2022 07:02:20 +0000
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 25, 2022 at 03:48:33PM -0400, Felix Kuehling wrote:
> Am 2022-10-25 um 05:12 schrieb Paulo Miguel Almeida:
> > kfd_pm4_headers_diq.h header is a leftover from the old H/W debugger
> > module support added on commit <fbeb661bfa895dc>. That implementation
> > was removed after a while and the last file that included that header
> > was removed on commit <5bdd3eb253544b1>.
> > 
> > This patch removes the unused header file kfd_pm4_headers_diq.h
> > 
> > Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> 
> Thank you for this patch and the one that removes struct cdit_header. I am
> applying both to our amd-staging-drm-next branch.

Thanks!

> <snip> I'm also fixing up the
> prefix of the commit headline to match our usual convention: drm/amdkfd: ...

Noted! (and much appreciated too). I will ensure I use the drm/amdkfd
prefix from now onwards.

Paulo A.

