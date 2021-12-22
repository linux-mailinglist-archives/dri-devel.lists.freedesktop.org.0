Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A647CEC8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 10:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519C510F917;
	Wed, 22 Dec 2021 09:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC9611276F;
 Wed, 22 Dec 2021 09:06:00 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a9so3454422wrr.8;
 Wed, 22 Dec 2021 01:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qqsydkxhhK8OhNALZ+VHv5FZny2skJQWB82QtY63Q9s=;
 b=iD43qYAfHKgHEkC7nFjFdmgKXSLsUqD1tOX38fFtuZq3qwU1j0wOHmZyk7cmiVanwf
 giLn4KfQ9FO/4viWuK2riNg5PiCPdD4ewWsqhFlEkiTV3nTPKAyrcHFu7M1bsoRhNrHb
 DdjPxoxSwSl/T6YDCv1lW4ghDMwcvgq1aFQVMWAxSSg+mmGR6ivWF3EEl+DT2KkwejeC
 q4iVCkw85/sEWSRS0UaCHotTDsBlulj+yeCrxqRIlEoCSP9aawdEQovt91JUKIKS4xmj
 fwAYgHhTLBy0VF70R1A+BOhUwvuYUvC2NVVlPdorxD2IOIdOmjlLF/8qIHczAgPfW/R/
 huXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qqsydkxhhK8OhNALZ+VHv5FZny2skJQWB82QtY63Q9s=;
 b=CtYZlK6iKz3zTpZ628wljVUG3objanhn0GRgMjGbyPR2v60ZoRDKjgQ32oqMAUh7ql
 47hpZT0oj9CGbdEtC99/wyXTrbLKVVrJN5bqAbm7NnOvmK9d6KQzG5xc/C4L0qBT13GM
 vBY4GOhN8yvX7Q+w5fkVn/Qwteej39jaqnqmjJHarcwF+4iiHV2jW+t4SLV1KFNbYI6V
 9fb3OntygPtwG+5TAJgrDtxQtaNjj7DD2VQSqiRv31eVCS4IVYdgAEKqnTtQmg66xHfA
 i+pVtN9lyKWKPPMDYl407+OT6UYClII0fmWJ17TgrM91Wj2eLmzs1wVd3seBCAevHdmw
 YgKQ==
X-Gm-Message-State: AOAM533Nk0BxYHG82HLlSZUJMh38BIO78MP4XffT+3sOBiC3dP34hxEN
 P3lOrc4rMi/NTO2I0od1180=
X-Google-Smtp-Source: ABdhPJyT0Au4GEtGNae85W38GmiNwbKwrmg900dN5iNRMKkALJW8orth+l2K+OpmtdJEWYLlqaDVRg==
X-Received: by 2002:a05:6000:1ac9:: with SMTP id
 i9mr1363329wry.531.1640163959472; 
 Wed, 22 Dec 2021 01:05:59 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id a22sm1139775wme.19.2021.12.22.01.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 01:05:59 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: contact@emersion.fr
Subject: [PATCH v2 2/6] drm/plane: Fix typo in format_mod_supported
 documentation
Date: Wed, 22 Dec 2021 10:05:48 +0100
Message-Id: <20211222090552.25972-3-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222090552.25972-1-jose.exposito89@gmail.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: airlied@linux.ie, alexandre.torgue@foss.st.com,
 benjamin.gaignard@linaro.org, linux-stm32@st-md-mailman.stormreply.com,
 marex@denx.de, linux-imx@nxp.com, intel-gfx@lists.freedesktop.org,
 tzimmermann@suse.de, s.hauer@pengutronix.de, rodrigo.vivi@intel.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, yannick.fertre@foss.st.com,
 linux-kernel@vger.kernel.org, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix minor typo: "valdiate" -> "validate".

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 include/drm/drm_plane.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 0c1102dc4d88..06759badf99f 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -516,7 +516,7 @@ struct drm_plane_funcs {
 	 * This optional hook is used for the DRM to determine if the given
 	 * format/modifier combination is valid for the plane. This allows the
 	 * DRM to generate the correct format bitmask (which formats apply to
-	 * which modifier), and to valdiate modifiers at atomic_check time.
+	 * which modifier), and to validate modifiers at atomic_check time.
 	 *
 	 * If not present, then any modifier in the plane's modifier
 	 * list is allowed with any of the plane's formats.
-- 
2.25.1

