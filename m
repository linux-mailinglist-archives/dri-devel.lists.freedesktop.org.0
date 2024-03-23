Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EE887770
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 08:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BA1112B5F;
	Sat, 23 Mar 2024 07:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="X6HrYG6G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1057E112B60
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 07:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711179668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XYrbwk7kuA5qjRdtDe9g6Utjw4722izwO5oHTWGLzAI=;
 b=X6HrYG6GwUaNttpa4/EJd/VV0s0i98z42LmUXlcIha18iqOazJPObgLsPZ9Vy2BXAqzc5v
 pOuqGVBxr1b/2fPbNjyXCVioHNKuhvE44gGbPB3lJ8SY/7hU2H1NcGRTkrQsmLPaRDu1gq
 UjcwyEp8t/Ixl8ntvG6CpKcMBzGFLh0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-nQVZGahSOMe9C6wiLUsR8A-1; Sat, 23 Mar 2024 03:41:03 -0400
X-MC-Unique: nQVZGahSOMe9C6wiLUsR8A-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-33eca6f6e4bso1411204f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 00:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711179662; x=1711784462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XYrbwk7kuA5qjRdtDe9g6Utjw4722izwO5oHTWGLzAI=;
 b=WQ5N/Fc12EOKdaO9ei6+7M+9BuOcBDa6eKqOYpIXgRejaAXAW1irAkneXWmkHXYKFN
 lfNEFw0RudDGU1zs9m2uSHFOPVBYX5lGjuqPb7iNn82Bfsadbxb9sXUOkVu0kEcveauj
 ywcoF4/YMgenWi4dEaOCQAmnXY6qzLZKaACd7ovycXZQuAceLVfSIlMMXLmaH2YvtHKp
 sGQaFr63l0Vingo7JFV0wm1c6ooCeTdVTIcj58PFGpwVJs30ww0SL2IHXckpg7z4nWqO
 ijUPA+AaSJ9OHfymTkn21YlJyZLWoDPV+LviKtE7ARc+FVw6IlECx5GeiGEFVTEeiLy1
 wLcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZt8Gm10Nvig3HqxU4jXkRVCWdJlHHaBcqDJkZDAxLzF21Nkxe5FGCO2vacgA6F9NkXtpPSHuDGloeOBzvoO4A8Zr01C8ZD+KXRDkrAq1F
X-Gm-Message-State: AOJu0YwR85jeSb7Ug0bMXV4ymQVKJxE7mG9p+ixhE16XQVXfWPcccv+0
 WrfcaUvsirGD7jGVPLFbtUi9P40L1Y+R6/k48148iDkCMb7GpPvRVDpb+PTuvZW/IAWGjILsY3G
 XnHg50Au4rR2KVedv4xpa8tqw93N8yCiB62d1P4C520WiKZ51KFsshCcongHkmYetFKh8xk9lAa
 YvxG7rCOf9HhxLjDivIGbSty//Nclw8BNQkzI3jEKJ
X-Received: by 2002:adf:cc87:0:b0:341:8d8f:75c0 with SMTP id
 p7-20020adfcc87000000b003418d8f75c0mr987229wrj.49.1711179661890; 
 Sat, 23 Mar 2024 00:41:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHAFyCx9IA825EMQEZKZRT8KQYafW6nQYtIVjw36eF5iusIwRxMgjSnfC+tsbJRPjErWFYElV4MhSNNyDsetk=
X-Received: by 2002:adf:cc87:0:b0:341:8d8f:75c0 with SMTP id
 p7-20020adfcc87000000b003418d8f75c0mr987218wrj.49.1711179661506; Sat, 23 Mar
 2024 00:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240322120339.1802922-1-ppandit@redhat.com>
 <1e546c01-1126-45c8-9104-14e769dedb8b@quicinc.com>
In-Reply-To: <1e546c01-1126-45c8-9104-14e769dedb8b@quicinc.com>
From: Prasad Pandit <ppandit@redhat.com>
Date: Sat, 23 Mar 2024 13:10:45 +0530
Message-ID: <CAE8KmOz6giC0mAr02TDC5c6V-G-K46ydMdpNqiJ3gQFC2ETh1w@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: replace utf multiply with an ascii x
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 dri-devel@lists.freedesktop.org, Prasad Pandit <pjp@fedoraproject.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 22 Mar 2024 at 20:54, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
> Seems that this also happens in 2 other Kconfig entries. Can you replace those as well?

* Yes, I've sent a revised patch.

Thank you.
---
  - Prasad

