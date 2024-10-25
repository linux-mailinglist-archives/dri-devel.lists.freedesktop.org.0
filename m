Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66819B09DD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F269B10EB1B;
	Fri, 25 Oct 2024 16:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZikmIPC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA27910EB1B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:25:14 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539ee1acb86so2501524e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729873513; x=1730478313; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bjUOMPmvbx44ArgARxQu9uiGnjONQ5DYJ9GEwVmwkiU=;
 b=ZikmIPC/kGE5T22HrIU8txLzZw7X1dFHO8L6AF3YvYXYHh/TCxOc7U0Q7K3ZjhKczX
 6hrDMg/WxS5NGJj9KLYDakQBBabbZS56TGbiqDt1ybX9QHnu7E4W5FY+FGNJ6nSJ1gXC
 DSJ46rvl57VDBjfK2V07/buqH2E/ayBJWZv3WpqE0hF75s2LfMRGc7hXWlblo5BXmmQ0
 5nCOzXia8561HqzcB8hswGJcWOnp4ogEVEscH23s4ReGjzhmeRyZ9ztkMtUgZczZtnmC
 M8AGUD2tnl17UPKzsec5G3MKi5QnHBXwXMufYYwFsSkJYkFM5M61X4oTLUuKOk6Qo66B
 JIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729873513; x=1730478313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bjUOMPmvbx44ArgARxQu9uiGnjONQ5DYJ9GEwVmwkiU=;
 b=sCAS/EEyvbjWz7mxeNDMUxq/F1gjAi4OMoCzcuAVzxDifyP1BUKudfb3X1rZwhcZNi
 wBmTiu6+bVMknRpCVR0tES2OsPxvunsCoN3X/oRNWnIXMLxU1du/TmOClGEo3E2gt+Th
 cVf0Xzq6aKAOhjl3mNW1zJYa9F8NSbSMs1lCD+NtSBEJwG2Qhe/Fp382JZXkuPkDU1jm
 Ee/AvYXXwso8qCVd8Uy8BtSLAZSQ2qoOnVRA7uSvBGcuXr6UpuqylTglXed60jzzTsoS
 7o8f/bhCSvavOyR+K2hgLlJ/gYdTXMedAfWLQe+QOMIxki1ydi0Dms2bkGloGJCVa3j0
 MRfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjY+hBL1aX2+e9yZL6lL9SSC7GcNdWnojfkMOJiIsj/NJkbFsPwV+Gu6wGO2f4hccPZ8TDvT70l4E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2eZl6MlfFjeN2jA1LmmAMEJFk40GEZNTwRhBzAov5OafKw6TA
 ysLL+IjbAVCqcrv7urdW4Ajs0NYDkmMjNLcfSgdpqJgabbsbw+c0KJdp7nUghiTS/6nPP48YQ0J
 lV+AVWM6uaVP0nb45f4a/BYf3A/KKrG3UBZkJPQ==
X-Google-Smtp-Source: AGHT+IGGbBVl6KvFdNDYHMTLMjeWLk56PcWbppKi28kx7t5pXxobDS9F5kYDuNnV/DVw3aRo8x3rgKDyjodwVLhSfDw=
X-Received: by 2002:a05:6512:ea8:b0:539:f74b:62a5 with SMTP id
 2adb3069b0e04-53b1a30d646mr6103175e87.25.1729873512702; Fri, 25 Oct 2024
 09:25:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729738189.git.jahau@rocketmail.com>
 <a899d5f0525a76efeab6f734b75e1eb95d9a2ca3.1729738189.git.jahau@rocketmail.com>
In-Reply-To: <a899d5f0525a76efeab6f734b75e1eb95d9a2ca3.1729738189.git.jahau@rocketmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 18:25:01 +0200
Message-ID: <CACRpkdYV5jEKzZUOzWMB6XwQseoORwVXiO1tEHVrC1O1GBauTA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: panel: Move flip properties
 to panel-common
To: Jakob Hauser <jahau@rocketmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

On Thu, Oct 24, 2024 at 5:18=E2=80=AFAM Jakob Hauser <jahau@rocketmail.com>=
 wrote:

> The flip properties were used by "samsung,s6e8aa0.yaml" only so far. By
> introducing "samsung,s6e88a0-ams427ap24.yaml" they become more common.
>
> Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I think I even have a legacy panel that needs this, good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
