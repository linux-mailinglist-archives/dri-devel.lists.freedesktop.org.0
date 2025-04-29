Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D86DAA1185
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 18:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9297710E4F8;
	Tue, 29 Apr 2025 16:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MfCIG1eY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A9810E4F8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 16:27:24 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-301302a328bso8650976a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1745944043; x=1746548843;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HclVyaYhDkOgSEJP0FWc3iF06F9vTvtmO/KyE9DKqLs=;
 b=MfCIG1eY3zi8rZ8IF10yHF7HT3sUlOStee0C/VgDPNS7ULqI3G1Q+v3Vc5XG0laK7z
 Ww22vv9rtbU6W2BE7n4rW++J9TSN3bcIwkM+bh2UIQOr+QuFhlnaJYQ0Ud/XfObXpmJu
 68W1veaWvuK8yN7chfufBbceBJKWBKNvR2UIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745944043; x=1746548843;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HclVyaYhDkOgSEJP0FWc3iF06F9vTvtmO/KyE9DKqLs=;
 b=nYyVBV2/wpTpO4+7sgBdxHlObM9lKt0U7B+pbn1aafm240tC0yq2DB1fGu7H2ndGtv
 WEuPL1VY5dmQjwaLKwz5R/YVAcA/AQvpRPihYV5n+UDxerwZUoZWY1IPBNOXemjpHY7K
 up5yfhMsPXl8cOgpQCDORO+QbIFqnKjHTLYP9dxbJv4ayRjWEDS7FpqDsgMaYeQKG3oi
 uJSxoHZ4uDMNLtFt9kwTVUGIU37Mb4LsOwJWTSbiO8cMlU4qzzsY2ZG3kdB2ldNoSkNx
 ev+FoO3bJxv+35jA/5E5E10JN0VMftB6G8Of0uHHm0/IWy7BD2hHfQG02FoLwYoSgpFx
 56ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9TeKcgKz54mJhawJQXuiSacxV8eRkuimE3pB2ToIxmT++4dpHbVEagM8VtVaohYTBLawxz+EWwH0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYvg4bmTuVn+gil87hl11k8UTzxR2W+nski2G6L5XqGq7uJGk7
 G/dVubK8Hjqkabs5QDAKylEbrYuMMdewXAiS/Du0n+PL8Na28H/fp6pfZ8fTtAMCTpDCpl+x9PE
 =
X-Gm-Gg: ASbGncu1+wv1pEQOXVv5Q8A1eiObIZj7U5+VJhkXFof97Xwxm3441fTWtxv+ysI3Mjy
 Pr3jUcawEfa0a5L83lx8BQQQysJIufE4pdgu6r3JqOKralbt8gh4PyAVxSH2bK29BQmWc4RFcih
 m9kN/tSRZD7O7CmuUUyH9hx9We1h0FwnTUMPj7UxXczSExD4clFgrwku4memJrs25ZRivtvYOZo
 GnWj87tLDs8VwprzXQcZXPoQxLhapeKuHOfw6nnQU0I3ZRNWq9WDpmGkltYwjNQSxTDCfug/ikw
 XDG/OEuUJzbusZuEN40H3fvFEdTA8ZsKUdLNXMa5rKMx1IUrBS6ngY3TTuaCxFfZ4xjVMtRQ7tJ
 0IxdlSMFO
X-Google-Smtp-Source: AGHT+IHOT5+xSliK+TzFBPffDzbKeju5VxbBMoYBfZo0zcAi2zGqL1jZZIlg+PX1n3ZmwzeB2+GR8Q==
X-Received: by 2002:a17:90b:2e50:b0:301:1bce:c258 with SMTP id
 98e67ed59e1d1-30a2157d90cmr5260623a91.22.1745944042861; 
 Tue, 29 Apr 2025 09:27:22 -0700 (PDT)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com.
 [209.85.215.174]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309f7760d7fsm9572563a91.21.2025.04.29.09.27.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 09:27:22 -0700 (PDT)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-af28bc68846so6017571a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:27:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU/+JB3sH9aqkSqKHIHICNYJoZnzXoKsJXiN0xouz/hRU0ZaJTJIkqC2ck7Ro7NKyWhAN5RI+h0n9A=@lists.freedesktop.org
X-Received: by 2002:a17:90b:5645:b0:2ff:592d:23bc with SMTP id
 98e67ed59e1d1-30a21546cf9mr5997284a91.4.1745944041359; Tue, 29 Apr 2025
 09:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250429092030.8025-4-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250429092030.8025-4-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 09:27:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V3LsgMkVyUo9ZNq7VBZgRzX-7hVSyvVGXSA7Woyu-R1w@mail.gmail.com>
X-Gm-Features: ATxdqUHg8RCvWUpfqr7D8JemmnKpizE5FcMLM7GqkurGFB3kpFT_tlqX5YrRVfI
Message-ID: <CAD=FV=V3LsgMkVyUo9ZNq7VBZgRzX-7hVSyvVGXSA7Woyu-R1w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel-edp: Add support for CSW MNE007QS3-8
 panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Tue, Apr 29, 2025 at 2:20=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> CSW MNE007QS3-8 EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 0e 77 57 14 00 00 00 00
> 34 22 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 cd 7c 80 a0 70 b0 50 40 30 20
> 26 04 2e bc 10 00 00 1a cd 7c 80 a0 70 b0 50 45
> 30 20 26 04 2e bc 10 00 00 1a 00 00 00 fd 00 1e
> 78 9a 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 4d 4e 45 30 30 37 51 53 33 2d 38 0a 20 01 3f
>
> 70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
> 80 3d 8a 54 cd a4 99 66 62 0f 02 45 54 7c 5d 7c
> 5d 00 43 12 78 2b 00 0c 27 00 1e 77 00 00 27 00
> 1e 3b 00 00 2e 00 06 00 43 7c 5d 7c 5d 81 00 20
> 74 1a 00 00 03 01 1e 78 00 00 5a ff 5a ff 78 00
> 00 00 00 8d 00 e3 05 04 00 e6 06 01 01 5a 5a ff
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 76 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

nit: your Signed-off-by should have been _below_ my Reviewed-by. In
general whenever you send a patch you always move your Signed-off-by
to the bottom of all the other tags. No need to resend this time, but
keep in mind for the future.

nit: this is unchanged from v2 when Dmitry added his review on the
cover letter. You probably should have carried forward his tag. No
need to resend this time, but keep in mind for the future. I've
re-added it.

Pushed to drm-misc-next:

[3/3] drm/panel-edp: Add support for CSW MNE007QS3-8 panel
      commit: 0d607a59a0f6593e72630854a8bcb8b01b8dce40
