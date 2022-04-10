Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1CB4FB534
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 09:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8466610F017;
	Mon, 11 Apr 2022 07:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7079410E266
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 23:49:47 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso15566665fac.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 16:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=nTHyisLKl+Q0FI0Y23Gh/PNjSPiHrWB/KIBAtZ1kFeA=;
 b=b3HsV0iufwWJYgrAsWxqJwwt3tvnC+vWargrs9rvppFVPKQrw45AIFzvzYb2Fy5gWP
 c81TEBtyQXtWKUt4rsMnpOzSUJ997EN95bIkkUI5muxtTsvb2BOEsVcrjOFpZU0HEkUm
 cXx3nyoEFAwzc6/pU40SOOasVIZ/2etvH8E6PnpicMhH4neTto14vmOJ56t6KKfHEe+9
 CasdQEwPjOKclcJn8aUDnwb2ntREKA+HgddDgNGRAiGgVBNuX6jfrdmCerGFozeX7BHb
 h/TgJeUuIsb52ApsWHjv2YA9Zf7feHwYS48Z91K1hGAe901yoRBgdBmm5aOEO5uxX87a
 FBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nTHyisLKl+Q0FI0Y23Gh/PNjSPiHrWB/KIBAtZ1kFeA=;
 b=1pGR5/NPKWiw+25VU8AjRZWzjjNjkUVx5LXADoZveclYkFB3H19gsO1xPFvynuyxi8
 c3Ia6YWqJcb0AxhsOdr1/fcLMTCf1PPlheb+STkXUIs9qdj+e+ARffcsxBZ4DKE1Mosf
 3pbKmLBfL4GmEoAhHaHuQKWvYdLgJOyUOzAMS7Aeyikwq7or0TEbvFiyMASwMMIGDzeJ
 3nHD0pGLTVUvPyfzIR0gr69yL8KXHy4vpiF9T6mA0sl2F5hmMtsJRM1SMRGpTVTnxyVL
 9woYrdHC6bx+luAPrHsonIsSF45YkQLMpDp9JtZLh9jUvwSsK175RZmSgdXrnU1sJanl
 qowA==
X-Gm-Message-State: AOAM530K4hnSMDZcqrCuKvJnVk18It4NtC6Vrcqcqxcn2IrdNqtSSCff
 m/wuSLpBVEpKtOypGVcFFugCAUzSFayxuCsVcnK4fz5Lpco=
X-Google-Smtp-Source: ABdhPJwN8rRS+a3RHYHoJua9uF4hJl0IicrwTbexoFkQ+KM/hAJ8DxRcYCZglPdoNQp4BcitqTsq171UDjtEGHASLnw=
X-Received: by 2002:a05:6870:f295:b0:e1:ea02:2001 with SMTP id
 u21-20020a056870f29500b000e1ea022001mr5229356oap.241.1649634586271; Sun, 10
 Apr 2022 16:49:46 -0700 (PDT)
MIME-Version: 1.0
From: Mae Chavez <maec6129@gmail.com>
Date: Sun, 10 Apr 2022 17:49:33 -0600
Message-ID: <CAMTJphAVjGvmg6t7KX7VmME3_gKNT+Pp78OEYNGwrxn2DR0cgw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/selftest: Always cancel
 semaphore on error
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000086220805dc557ba8"
X-Mailman-Approved-At: Mon, 11 Apr 2022 07:47:33 +0000
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

--00000000000086220805dc557ba8
Content-Type: text/plain; charset="UTF-8"



--00000000000086220805dc557ba8
Content-Type: text/html; charset="UTF-8"

<div dir="auto"></div>

--00000000000086220805dc557ba8--
