Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D333F73A145
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 14:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EC210E1A5;
	Thu, 22 Jun 2023 12:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0981F10E55E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 12:54:51 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-312863a983fso2243908f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687438488; x=1690030488;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puuQ8+MiyFW9goYXE4kCotDEdvP0UnSkOBg67Poqf1k=;
 b=qTsVhT3mI5gQ6wLcQjRzMqN0dyeUGYVRsGWZwaO+fhA0h7F54MKyIZ8ekgKdm1wNiy
 4nTlDBG/v//UfQKjQnjilGcr1/x3rjTnXQWmRz158PswDN1QHRM9UcdEmg+p6MHdLhFM
 1iMY7gGXQ0w85mYOArrSNrcj7CGMX8kV9kVExITEX3DvBRN3wUU3Gx3YLAlNAVZNO5Yt
 J8nMAbVOPhIRJeLfBsgepxV/26ldF1aiVGxwq7zvsLsbWlEzaxLd8hqXQ5L4EgjW2FwN
 O6qaD8JiE6VmYGTSwcNM4cm8FxDd86z2+HW7qMVE0ubJrf3kOYIQkGBEoa9IKJsTscHL
 Vbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687438488; x=1690030488;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puuQ8+MiyFW9goYXE4kCotDEdvP0UnSkOBg67Poqf1k=;
 b=GQm4FWx3ecZL3YrlJlQ88CqwJreAqUg6q353SVLwX//OTcDYOGXyNXGQ21l9htYqOD
 s2JL1ORkF15ZnmE294EcF35aRuAjNdCVTyUueiYtrn00PCg2Bk//5B9UlB5mxZT9OPu6
 V9NMInoejqOaIutD6yMhQRxuFuahSexyhGQHmIA0KIfOkZipg70FqFN7M0qCmQyXO0zO
 VLLAb+SSxi75jSFsiDFpCfa2YvqZmxlzJ/UCjoeN9HP4BZAm6qPYrsKkEuFH75CQR1cf
 cHpaTw/qFXWiCTG0E5bIU86IpiRw7T2hbjJuQlS9yxsxyywg8BPN+30wezI9IcTXAzhd
 PeqQ==
X-Gm-Message-State: AC+VfDwS3l+k4pySZ+jwvGbdivPLG11+zf/AE0rqnAX/VngleXyzEIIV
 jScd+5L4ooHDTkqMPDlEU40aOYOKdswfjyejuUisPA==
X-Google-Smtp-Source: ACHHUZ7ICDGu3/aINo8nDcJe8b83x1OSqpdN4kA5GF0lEEm5vYU1JSP9lE3eEZX8MkznWh6/KnzUyQ==
X-Received: by 2002:adf:ea8d:0:b0:311:1b8d:e566 with SMTP id
 s13-20020adfea8d000000b003111b8de566mr14588209wrm.52.1687438488065; 
 Thu, 22 Jun 2023 05:54:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a5d5651000000b003093a412310sm7018500wrw.92.2023.06.22.05.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 05:54:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: ville.syrjala@linux.intel.com, andrzej.hajda@intel.com, 
 rfoss@kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
In-Reply-To: <20230601123153.196867-1-adrian.larumbe@collabora.com>
References: <20230601123153.196867-1-adrian.larumbe@collabora.com>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: fix connector access for scdc
Message-Id: <168743848722.2641303.11458773373103402384.b4-ty@linaro.org>
Date: Thu, 22 Jun 2023 14:54:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
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
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 01 Jun 2023 13:31:53 +0100, Adrián Larumbe wrote:
> Commit 5d844091f237 ("drm/scdc-helper: Pimp SCDC debugs") changed the scdc
> interface to pick up an i2c adapter from a connector instead. However, in
> the case of dw-hdmi, the wrong connector was being used to pass i2c adapter
> information, since dw-hdmi's embedded connector structure is only populated
> when the bridge attachment callback explicitly asks for it.
> 
> drm-meson is handling connector creation, so this won't happen, leading to
> a NULL pointer dereference.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm: bridge: dw_hdmi: fix connector access for scdc
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=98703e4e061fb8715c7613cd227e32cdfd136b23

-- 
Neil

