Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 605667AEE56
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C92710E0C1;
	Tue, 26 Sep 2023 14:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAA710E0C1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:11:31 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-57ba2cd3507so3090343eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695737491; x=1696342291; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QHnlZqlWlhGb22TtFxRPx0T3YI3z8PsMCtRycKgunxo=;
 b=wA+/5ZmitiaA4w2LyPT8PMOLOfZXM4BVhcoBMFxgJTfJOfPMxEwWbUUWYexwFYRafL
 kDxU/voZop67qTwTjA5hVtVaMaGqUQU3g4Yoa4OdD+ZvDa+RKGjueuuXW+wb5EpgZF9M
 6g0oVacCMt1ETs2CaXMPd9omppETz3ay6iD8zdB2nse2f6rCZDadxoPjyMQ1wukbQtHO
 Y1FkN6foDMYU6fhxI3VveINmApS1XiHK/+sWdW/93jT33/huckaXBxf5GlIatqrhmKTY
 2HfZ5fzkFkJOJtwofgr95VXmsSgmwYP4QlogYLSk5PRUt1ZQRNGdy3I9EHpZx09IVL57
 rung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695737491; x=1696342291;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QHnlZqlWlhGb22TtFxRPx0T3YI3z8PsMCtRycKgunxo=;
 b=rWyI9apSG/5NM+MbJlrZ5fTccBGvo3LJDoWEyJDaMyM7LHT3IyZLeVD3gTROVJlIbu
 37iRyS1pszPha2NVzK3pSNpz2gzZnxeGdYz40nanutbfs2YljkEEJW2j6x4RwDpUfOTj
 1QKKVb3CRGWOtekmQ+U2GmMoxeXZfQw4vWK7RbvTZBBL52xy7x5dzD+aK9//yID/VQaF
 fQxhKMh6L1h1OelMZ4dklTt7OFg6601IpjUkw5tU5PxZM22XhbI3PCFKHVzjEvG80jRU
 FvD2OTOEKeQ9yPS2K5xJq1Kmi44RQgFEG6FcxCnYWT+08WYIXUklMZ8Hx2U/yJHp7hph
 I+gA==
X-Gm-Message-State: AOJu0Yx0JebEOY0X8n5eqmC+v1d9V0lPynHoJS4z9YaAgiiHTByurAmm
 FnOaPnlDU2TrphqSYcsYz+ERFTBTxZ+WJLqy2Y/Qcg==
X-Google-Smtp-Source: AGHT+IEt3M8f4wyq9OpZk/HgG+h5aHsLj6KhEgNMQlByL1BEubtbnozJQ3gGJ5oxafL6uOGtiYe6rUpIYo8S/dBKTNc=
X-Received: by 2002:a4a:8515:0:b0:57b:4f1e:96e4 with SMTP id
 k21-20020a4a8515000000b0057b4f1e96e4mr8915121ooh.1.1695737490077; Tue, 26 Sep
 2023 07:11:30 -0700 (PDT)
MIME-Version: 1.0
From: Grant Likely <grant.likely@linaro.org>
Date: Tue, 26 Sep 2023 15:11:19 +0100
Message-ID: <CANH6bkCe2L9-zL8aroiALVhjb5uOwcWH5Pw8HPb4Ac7jZ2z=Ww@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm: Add a driver for FW-based Mali GPUs
To: boris.brezillon@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, drinkcat@chromium.org,
 daniels@collabora.com, Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, peron.clem@gmail.com, hanetzer@startmail.com,
 robin.murphy@arm.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 9, 2023 at 10:53=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Hello,
>
> This is the second version of the kernel driver meant to support new Mali
> GPUs which are delegating the scheduling to a firmware.
[...]
>
> I tried to Cc anyone that was involved in any development of the code
> I picked from panfrost, so they can acknowledge the GPL2 -> MIT+GPL2
> change. If I missed someone, please let me know.

Regarding the relicensing, Linaro agrees to the relicensing of the
parts they hold copyright on.

Acked-by: Grant Likely <grant.likely@linaro.org>

--=20
Grant Likely
CTO of Linaro, Ltd.
grant.likely@linaro.org
