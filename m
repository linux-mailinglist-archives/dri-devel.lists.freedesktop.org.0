Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C64C0380
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 22:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B4A10E5FC;
	Tue, 22 Feb 2022 21:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1725810E5FC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645564048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+W6pO2BVl1KFNm9/3y2Evt+Vma/Y40BwnJWTsuAtQeI=;
 b=YUyOyhMfUg+UiGBLjm/o7/hmBFaDPivwu//94Of3Y1fqHUG4igWBf17v/hMFUGcDo5E5wx
 1woV03LfjIqobslpDKo1Vkk4CJcTKvmDJaUzZezXxU2QC6xlH2MBNhrr8VRdx1+iZnKT8t
 b/MHHJjbj5tpE3fW3rW1/vakKBN/4iY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-zqOM_T7jObWQ7yc3uaYzzg-1; Tue, 22 Feb 2022 16:07:26 -0500
X-MC-Unique: zqOM_T7jObWQ7yc3uaYzzg-1
Received: by mail-qk1-f200.google.com with SMTP id
 i189-20020a3786c6000000b00646d7b30998so1036236qkd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=+W6pO2BVl1KFNm9/3y2Evt+Vma/Y40BwnJWTsuAtQeI=;
 b=POhbRDcRc36d+nzzQRUz46CGqFwXyiPNDZrDmrsa7AYSTKN/LAIEJHlZF9gDg7zRy/
 Joi8EkGNtVfPPpOoMlx/c0xSTH4AIjq44iVbG9r0fRZ5o9CziH8x13zYIzK32eKCLDY7
 Xk+yZGr2pS6TfL8FVJpP8txCIeU+I+zX2AztqfdJlfWVeAwWq3nFPHMwoa5nVmH+gI+t
 jCpwWtaGVf64BAT8AvK+MtAFFSNDgYniEE2j1zq5qBTdy883VpzMvMc6rHfENhX3eQkE
 8gRIYJmujk8cwYFnkkZuACVLCG4+NcDpEsA+K4/ZiPAwGJL3VaeZG63ApcnFoO+HdHPL
 aRrg==
X-Gm-Message-State: AOAM532FzuaRwNE5yAixeTPlxcUuWnAlQQQKfTkxHQrbXCUCgXAWE9o2
 fkIvmEx+5esWLorZ9UhWb7IX9NwVEHiq4fVFW/7pIdFnqSCHo7t/I+HYYK8py/VihpKQKtxDlq2
 i58LeIE4iBwxDwXypuoAjNXke6hdJ
X-Received: by 2002:ac8:5c02:0:b0:2dd:219:2489 with SMTP id
 i2-20020ac85c02000000b002dd02192489mr23745370qti.201.1645564046151; 
 Tue, 22 Feb 2022 13:07:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0lh3G+LG3aGNdHwxXzkf6Rp52uIlHThUHq9/hj35Ymaq/688e5olXmt8x0eU1H2xtKggoLA==
X-Received: by 2002:ac8:5c02:0:b0:2dd:219:2489 with SMTP id
 i2-20020ac85c02000000b002dd02192489mr23745346qti.201.1645564045888; 
 Tue, 22 Feb 2022 13:07:25 -0800 (PST)
Received: from [192.168.8.138] (pool-96-230-100-15.bstnma.fios.verizon.net.
 [96.230.100.15])
 by smtp.gmail.com with ESMTPSA id bp18sm590391qtb.72.2022.02.22.13.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 13:07:25 -0800 (PST)
Message-ID: <36199eaf507a367f6934f925da05c17822bd701d.camel@redhat.com>
Subject: Re: [drm] *ERROR* mstb 0000000057b5b857 port 1: DPCD read on addr
 0x4b0 for 1 bytes NAKed
From: Lyude Paul <lyude@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Michel =?ISO-8859-1?Q?D=E4nzer?=
 <michel.daenzer@mailbox.org>
Date: Tue, 22 Feb 2022 16:07:18 -0500
In-Reply-To: <e884992b-967f-4e57-72c9-70c50f259cc8@redhat.com>
References: <47101f87-48d7-0c93-adbf-9b84cd3754a3@redhat.com>
 <4c5c5325-3e6d-d1a7-bc4d-c38ad769701a@mailbox.org>
 <302fe05b0ef4739a131fd6cc7d33272014d4b6bd.camel@redhat.com>
 <e884992b-967f-4e57-72c9-70c50f259cc8@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Richard Hughes <rhughes@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2022-02-17 at 23:07 +0100, Jocelyn Falempe wrote:
> On 17/02/2022 19:15, Lyude Paul wrote:
> > Hi! Sorry for the late reply, I had to take some time off work
> > unexpectedly.
> > This is normal (although not great TBH, I'm not sure we should be printing
> > an
> > error message for that), it's the result of fwupd trying to probe the MST
> > hub
> > to see if it's a specific Dell dock that can receive updates over DP aux,
> > but
> > it's not smart enough to know it doesn't need to poke the DP aux ranges of
> > downstream branches or non-MST ports in general.
> I think MST topology is not exposed to userspace, so it would be hard 
> for fwupd to be smarter than that.

We actually do expose a connector prop called "path" (or something like that)
that can be used to determine this. although the format for that is admittedly
a bit strange, but it should work

> 
> > 
> > Would definitely accept patches to make this a non-error, or at least make
> > this a non-error when the read/writes come from userspace
> 
> I will try to provide a patch for this.
> 
> Thanks,
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

