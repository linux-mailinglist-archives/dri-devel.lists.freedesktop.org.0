Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A15931637
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 15:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681ED10E3C4;
	Mon, 15 Jul 2024 13:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ScvKvrMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC94A10E3C4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 13:57:42 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-44e534a1fbeso468921cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721051862; x=1721656662;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S1IdPkkbzvH/BAaWYOMPmxaCglX4fyw6oCXKUAhpCY8=;
 b=ScvKvrMBUMrow1RMAB1E1e0XWX8I2AsF4QWHuql3SXtLzOvA4UVYvkS6+5dmlbN3Sj
 h60r2Y2GyBwmBZb7n4AP5lKlO1fdx1tvxtTgkn2iciTz8W+DP8EOjUghxmDrkqFYErnI
 uNi0fbDt0MhvPYreQLq8o3Uh25OKr0UJ5haG1dtpVAOZkQHO+RMiOShlmpa3OPFbeOuB
 AndFEmh9v0WV39wgsTwVC0pPxl+ChgbnlBe8uyEHbHRuJrUsfQdZx/eZS8KapCNJ7klD
 cGs+QECS6w6Ol6jFQn9M8usRo3MHkTvVZt8MyDFOWugRUzHF/krrdyDQF6mjaylba00p
 qn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721051862; x=1721656662;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S1IdPkkbzvH/BAaWYOMPmxaCglX4fyw6oCXKUAhpCY8=;
 b=lbAGFBptEKVQF6SGiN3zi1KwE+CHx1r3fRb4srcFuOpiOOIyCBlHZQlKoBYccHSvJp
 NGe0vKyj5Z4VBRl8LaALGNHtPmHWDSclJs6G8Nd3rU0HP5kWIpCAEuW7r6dHeczceNyJ
 2vNsWiqwng0ERCM1qENm4+9BSd9IFs3uk3w3a7aK6o8QCPIkU2VPTRLobADKCOVSjN+C
 eRJaF5XWsYe4Mk6OQ2hyoGU0YKDIJIao2JG20zFUd6H4BjXh5XOdBLMrzYmDmb1V8fjM
 keEKmB6kcohgd9vFobIfzUIUqLX1m1Wc932hF2x+6vAPQmj4qrHrMYwrTfr/xmkSCWEX
 1rqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWphACaKeTTjcqzN/xIoo9yJijmXsml4Va0NXcvCBaPWnG10ByebJDEbE79qFwRQsIjvfRFu0At54H3znHfkcXGdeVex+6ybuu9gkM42afz
X-Gm-Message-State: AOJu0Yw1PIfAP74Owx6Gdv8/9cq1a7hngi/jJYWouP90sSlWdWnMmFTA
 qmTPL9hSxC5cSyLQvjuCv9OtoL4GjUwywjVpwczUR5uX+2smNaWmglSnAtm+V8by8A5j+Vnr5XW
 IdxEVWi/Pw0iNtCVQkRrk9j73JndFOb+aliVs
X-Google-Smtp-Source: AGHT+IGLMm++Rq6uGcsEbcNXyU9MTIXd9G9Ph8BD4BbCN85VisAAtiYu9NsxCDZ5vogpBxxIaa7coN2dNIuSqgYEpqU=
X-Received: by 2002:a05:622a:298e:b0:444:fd8a:f1a0 with SMTP id
 d75a77b69052e-44f5acc840amr5520031cf.25.1721051861734; Mon, 15 Jul 2024
 06:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 15 Jul 2024 06:57:30 -0700
Message-ID: <CAD=FV=XzWvvwsRrXDCdx_fLZkTLc=CCREDYt1gSmrOtN-EBBUQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] Fix the way to get porch parameters
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com, 
 mripard@kernel.org, hsinyi@google.com, awarnecke002@hotmail.com, 
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jul 14, 2024 at 8:18=E2=80=AFPM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> The current driver can only obtain the porch parameters
> of boe-th101mb31ig002. Modify it to obtain the porch
> parameters of the panel currently being used.
>
> Zhaoxiong Lv (1):
>   drm/panel: boe-th101mb31ig002 : Fix the way to get porch parameters
>
>  drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

For future reference, if you're only posting one patch, there's no
need to send a cover letter (AKA patch #0).

-Doug
