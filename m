Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35120A23E1F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 14:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB1310EAAB;
	Fri, 31 Jan 2025 13:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DfqhKtwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE32510EAAB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 13:09:36 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so1994657e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 05:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738328975; x=1738933775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+ilJofaI+jD2h//x50bz+rerCHryaBa9HkfCASwoHRM=;
 b=DfqhKtwf+eW7mV/UX0/eAcOCzpOSB80CeJycDEB1C1yYlJQcFN9e5E5ULhG2P6vzkf
 X+H4lsvH/L0evJGtYIuLHun88yCiXoj2HmXmHivUH2z3Vsrw7uAv4n7NsAKqSYH5WR14
 lL5dCCvMTQHO/a4ixf/aYZTW94mCmFJvvs03lXpgi63qWiSy/yN7Yz+XWmF7Jc3SpCs1
 fz6VGCZ4K+/X0pqqvlU5LljAplBw8s4GI3Yeq5SWopFmfi1KJsKJuDhZdfQ+M1q+lTO6
 xevLtEEciYijjMzY2ZvlUhJCgLinJT1brHnFelLvrpcHymFRcyN3eg2YeSavXLc2PkXp
 4F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738328975; x=1738933775;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+ilJofaI+jD2h//x50bz+rerCHryaBa9HkfCASwoHRM=;
 b=rwrvPJyqa75Sy08pPiAZC2eiFYcNBFURHwXzrXf7K2+3JWF7qIrYg88CGz1aue5jtL
 g8KjpWiULT6MxAQvQpJby4j9obYCZWPj+JOd8PSOvYrdf4/sfIJQ47zV58vyKqME5it0
 oWrAuZv7iMHkCORBJWFY5Zf7tnpKmE2waoOjqekGgafMI5MUL56637mm+mO/iCARPQV3
 cSdDhbTOFadvfQPZ6dH2cUGSVEH2lTFhgnTAriMZp/BWt/uhS0RU+pEEeXhzBcDm0Gpr
 G0yoEIZBUkHtRG8d+fwFOSz3V/58l16PgYg6jAqBbB7Is1JrKMVvlh6dpYjJ7lTMw/r/
 +o3A==
X-Gm-Message-State: AOJu0YzARePIki022TOrV/VMO12PjhfvOvVUp7LsRzOXs7M0Hjn3P4Qr
 Eo5AMjq4bhexGBFezVCsK1SrpfkIaqoHICsU18hOODucPP1GSdm1dbJdTaHdLKvCLJK0/sSExbh
 mdUY=
X-Gm-Gg: ASbGncusgAFaqkENsekBufEcAJbD70rIWiyoeo9P/vxEcjfgxtW6QZ9dn/c7FuZuwTx
 P6eldcEFNSFhaDC+/DT2E06t1B7W8tYOrclGQaHL8nzb8zHd90+8VM/0WP7U30AxlXAikKPr9D3
 c05fjWgpqLIZgVG2Yo9MQrUO9qEOr1zEgLFXXg0kMA/ts7uJs1MbvCErqvdBl3N+RVsZ6wV/tnd
 aWcHlI+dUcPwJef1icTPJqL245zsxZS8UTLKH6XR57Eb6oT2U77ANJ9z2FTZXc80TwGb0K6sIys
 M1avIamk94w1oGNWMImxrTGgWt/9S0CkBi9Z8x4Q7baYLmQzRDdJ0WME9ss=
X-Google-Smtp-Source: AGHT+IG/+GMx6g1W5tJ6RHEPx6kKDqXp5EIrmUMWkH1XrLaoko3F5JbTbkHk1lZfpv6wKm3f1EcviQ==
X-Received: by 2002:a05:6512:3ca4:b0:53d:f177:51c2 with SMTP id
 2adb3069b0e04-543e4bd63bbmr3786512e87.11.1738328974760; 
 Fri, 31 Jan 2025 05:09:34 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307a30993adsm5719941fa.46.2025.01.31.05.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 05:09:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Farblos <farblos@vodafonemail.de>
Subject: Re: [PATCH] gpu: drm_dp_cec: fix broken CEC adapter properties check
Date: Fri, 31 Jan 2025 15:09:30 +0200
Message-ID: <173832895910.3304844.12852379411429746576.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
References: <361bb03d-1691-4e23-84da-0861ead5dbdc@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 29 Jan 2025 10:51:48 +0100, Hans Verkuil wrote:
> If the hotplug detect of a display is low for longer than one second
> (configurable through drm_dp_cec_unregister_delay), then the CEC adapter
> is unregistered since we assume the display was disconnected. If the
> HPD went low for less than one second, then we check if the properties
> of the CEC adapter have changed, since that indicates that we actually
> switch to new hardware and we have to unregister the old CEC device and
> register a new one.
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] gpu: drm_dp_cec: fix broken CEC adapter properties check
      commit: 6daaae5ff7f3b23a2dacc9c387ff3d4f95b67cad

Best regards,
-- 
With best wishes
Dmitry

