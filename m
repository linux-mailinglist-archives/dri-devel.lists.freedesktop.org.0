Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E4BDE633
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 14:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8EEB10E7A1;
	Wed, 15 Oct 2025 12:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="MYoewjL/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD91C10E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 12:04:31 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-88e68c0a7bfso99553585a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1760529871; x=1761134671;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
 b=MYoewjL/vwDYq3coel9hzz+PwQ17hKdmPqn9U5l3tr4IK/YQM7nYSfkiGpjCOf6vWU
 jBmJqWtGS9Log4iljNq0wCLe+Q6ZfRTd1m5b9YtXd4oW+pzcXjQgPPQ6Erltlg2+i0ee
 iquKRXCXhLqf4xtXhTSYzis79paR+2gUbMdg8Qg99Fj/IPBk6qo6m1MEmuUjwgQwASIf
 qhCAJocJx/V75IBrDE+bL4DVwQh9TUAizsT3NfMd2pb3Xl+0vsjHCCK9nj0zaWAVZGk5
 SqRxwkuKSp5fqP6yWO9N3EOH7nhW7XUv13KP824M1dKwPX9Z6fJhh7Q/d8QDGZpXheG+
 /7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760529871; x=1761134671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIkDzOp9lOkC64phyHj+bKX1qlxxtXvg/X9w367rNpc=;
 b=qCMlsIuLXXRO/Oxpd/P2W8TL9mEktretpH+qJ/Ao8XBx8AGxbjjOX9C8gm1zKcq+Jc
 T9/Yk2x9GIOMVhH1sYxxiR3l8GqK6d06hfMgVVWG5bzvOaPYqk4msQWXmi5wggivut/P
 59fx0AkyzsFQjAPwXp65ES1JNyKcR3Nvvcmc0Gi1PG/jjzjp+0mZoJXm5JHYSztUgs29
 n52dTxR+yj9BvRtK8dy56N6RgXU+GUq2iUR5lzBlHTNze2u9TNuvzyoX7WTuevjwi9M0
 SC2wWXv3hVWUS5pZCDhbLOppPETk0zZAQxGnRQq1vhS1uUGjHBG70ngwBvkVy+cY1dMn
 L0zg==
X-Gm-Message-State: AOJu0YzHaNZaTmSSfAZYvWOcvOY7gL42EdO6rPu7QvV5WRTnVL7FEGfd
 CvpffEjzcEoUL9qdfHqF7i2UuWVcgBInBOdncHU00HRHTdwNpZNjF/swc57RcDJdbFJPBQc3Quk
 57VOJMneC6C+7GEpJM/h/OvQ2AVuxnkNLPCvUSBYj2Q==
X-Gm-Gg: ASbGncvFec1SC7OGOX5+HBX9Qp4f4e1QXQQ3VMsKQvD0xMq01pmcR5V1ANv+2hFZpc9
 ahBY+gMk7zQ0vANHM6skYxhV4L1NXdjeycOZK2OQDI4yGFiE+B+wxdUU+hUu0Zdro6gFXvqG+dP
 ZXYYi4/3TYVYMUsZHXWL7mOJhK8rUkD1jVhVkocr40A2TivzZED6VNbvUGuEHZlGtTNjWjH5Svr
 RWlYuB5SY/sn7tvgXCxDEcpvWks9959kQ==
X-Google-Smtp-Source: AGHT+IGsy4ghNUujV8ICs5xCd3l4JFRIFi1WBGAyKhaZaEA9CMFYjjgZCN0vS1WL/9stf48sqTR9sa0kj6mJ0PU2Rkg=
X-Received: by 2002:a05:620a:800b:b0:85b:5fdf:69ef with SMTP id
 af79cd13be357-883524cb7c1mr3776426285a.30.1760529870781; Wed, 15 Oct 2025
 05:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251013060212.14583-1-vignesh.raman@collabora.com>
In-Reply-To: <20251013060212.14583-1-vignesh.raman@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 15 Oct 2025 13:04:18 +0100
X-Gm-Features: AS18NWBrg_BqO2tS4RN_x8d2btqMDE8us2R2sNEBkP2IYKjicDOGCIjh3Jp7IkM
Message-ID: <CAPj87rPDppYBRuQ99mh=VqrsSErGKcw-ZRY+zPuGrDj77G5k6Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: disable broken MR check in sanity job
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch, 
 robdclark@gmail.com, guilherme.gallo@collabora.com, 
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com, 
 lumag@kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, 
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

Hi Vignesh,

On Mon, 13 Oct 2025 at 07:02, Vignesh Raman <vignesh.raman@collabora.com> w=
rote:
> GitLab recently changed the required permissions for the
> are-developers-allowed-to-push-to-my-MR check:
> https://gitlab.freedesktop.org/freedesktop/ci-templates/-/issues/81
>
> Until that=E2=80=99s resolved, disable the check - it=E2=80=99s mostly ob=
solete anyway.
>
> Based on https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37782

Thanks for fixing this.

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
