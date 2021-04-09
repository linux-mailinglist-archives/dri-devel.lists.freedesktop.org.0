Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB4935A139
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 16:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406376E4AB;
	Fri,  9 Apr 2021 14:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028E86E4AB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 14:36:14 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id q3so5950185qkq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 07:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=EJuvcycyIbPa6J675iGyUHRdsq9Wx9OaZYJ9FyJ5nEQ=;
 b=BnANjNFb/Trm0ooxNcmPQLLussTgG1LGRQ3GaAnIzcsOSt5uXU4sGpJ7BlEjwC8m/V
 OvkzTen6Pg9zPiI1/TqwKwi1m5gkXFsJDXtPeAtAw45SmH+1A7KSqPf/WTLAWgnQKAMF
 6uB2XfH7oMLdGJl8neMQ17GKCNQU7SlgiI9uz2brqyN8CV7NONU9jTLARP9JBbmp5h2R
 lJWA2MB3dA6IEcF0R6/vsn02gFjSW7bpEoFuiV9fEO5rOnZ7IdNvNP/q0iWiz6tlBq1U
 HkrThJi5qcNFj/ojDW0D5raIoW/p42GWoPze9G5sYj9YfjvzSufExeyLspgwq3WPNFV4
 BjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EJuvcycyIbPa6J675iGyUHRdsq9Wx9OaZYJ9FyJ5nEQ=;
 b=rIAg/U/cKoF4gmBdseJmeVF1bBDeM1bGZhBXPOy/zfoAfRIM2BiS80W2gCnApmMUnB
 VhYCNAYTLtMPO/+gZZ5hhQO0T3JNLq1VWJ65x0sYG11hNq8ySUcRllT3J6IMAIxN7gfi
 U9eEPejlNJ+PyItWyb98aAinVDbAeTggtC2TOAb1XwFhnYvFhpKYpKoxk00IPg5eYm69
 TKvF277h0tOcCj8PXjetl8IDb9VDfNa0NoqJ76z4nCRfnOM79VHGmrP8dy6UeVvvCni1
 Vy59ii8ZkduNYS6H5l8a7xwX4EMH4b5sYnukuq+RQ8z0OaM5FiL/+fP8/TCTu3TU+5n6
 0eLg==
X-Gm-Message-State: AOAM531PPxQIQH0d5tmyWXp4DT5fVf1xQsZfnZthXCWoYd2rPeX4gHl2
 /yeYhkkXgBePXPXBcsEg99j2vvfZYiGiJUJRoW0=
X-Google-Smtp-Source: ABdhPJxCKzCseZRiR2YWVzXt9jLzZNh+7TW7yGdtHp44w1mwgu2K7V6oJH62XH4nFMvB+u5Da3glQJjfsFyJYW8QY5I=
X-Received: by 2002:a05:620a:134a:: with SMTP id
 c10mr13890799qkl.481.1617978973990; 
 Fri, 09 Apr 2021 07:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210409130113.1459-1-christian.koenig@amd.com>
In-Reply-To: <20210409130113.1459-1-christian.koenig@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 9 Apr 2021 15:35:47 +0100
Message-ID: <CAM0jSHNF4UEEduUxDk2dPpjKZBkJv66PQSfqhQcSORh2y-t9Gw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: fix return value check
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCA5IEFwciAyMDIxIGF0IDE0OjAxLCBDaHJpc3RpYW4gS8O2bmlnCjxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZnVuY3Rpb24gcmV0dXJucyB0
aGUgbnVtYmVyIG9mIHN3YXBwZWQgcGFnZXMgaGVyZS4gT25seSBhYm9ydCB3aGVuIHdlIGdldAo+
IGEgbmVnYXRpdmUgZXJyb3IgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
