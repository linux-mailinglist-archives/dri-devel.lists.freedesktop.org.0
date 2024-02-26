Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1A68667E2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE7DD10E5C2;
	Mon, 26 Feb 2024 02:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OuVBqPDg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEC710E5C0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-512ab55fde6so3114410e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913508; x=1709518308; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3YO49NCblAtKBTyW/HG28rdBp+P7ciUnjc6tjgHkhxc=;
 b=OuVBqPDgLThezZH2I9fsvfJ3oqjc6F/9G5+Eh0XVB+6TRt2OWxm+p5s4lorHZvU6Zs
 ULsahm4tMoUrI9oxKs+BxUKNWZPuZtRNX59obu8B+Nq4IbyWbC9RjpwedVQ/TaHc04jG
 uwGmzzHfxh/IGQDLaU4hlM9AsW79lMSJ+nxKLVYKZZdCQjMYHO/EnVBJuLXhLCMGHhgR
 G9hYDpLa+MZ8x37KMCU5v2HdXE6/mdv4Kl+VvHVQzms8OIMKG07ZYUMaMhC+LqnA17ex
 QBJ4oQwif6a5UW6ZxWqcpFk/ClDKMLVtHu/n9hSr2qLaTBALWmNc0ffeplg+x93m8K/z
 rnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913508; x=1709518308;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YO49NCblAtKBTyW/HG28rdBp+P7ciUnjc6tjgHkhxc=;
 b=Cra849euDoJjfbSeKkvvv/ZmrtGTB6cW3FtPTTV5amrVGpQyyaLjOzcw92UMs9yHSg
 bW2JdXSWCH49FdxgnPG2wN3wvP9fyTMunfCdEtwdmajzHHYI0PbEJJn3Zt4G2yuwnCNa
 hfYB5oV2aO7dI/afBW801qk0q+pe7JoK2nn+BzLfNpodLFzI08n4Ko5JNw4IHc4zondm
 yVu9vGJIqEYIbOJUqhDW4tdDLLUd9HZ1y3AAQg+HLQZngESWoBhkHXVLHxlc5UcP6cQY
 VMLeC4FaN5m82fSzylyPs/roiDY80XY066P4Jv5vP2hiB8cDaTW6SXzImmQph9zLwWG+
 g3Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCULwqbtEaCVHv00ScxMgs7lLzp9fGDVWQz2IJHA2bYR0eZSODEzPtzrloACOmx/EutGvk3lK938XsB6pkrgC+CiOkdWfCwftc+qoS0cpCkO
X-Gm-Message-State: AOJu0YzkBdVhuZdwwM1BfSas11oUbfT3RIj9hsjCteLOo4w4gQLmwqkq
 nLZtqwIKdR2xiD+V3lQsn0WD/YPdxOiEFiljnLdRMc9y06P7Z+03CPMx8XcZlsM=
X-Google-Smtp-Source: AGHT+IGM6arZuGaiRIqhoTaiESYpSqS7ARUqNQhjVEnkptr/m2/6XCawaKQgJuuQGgnyQSeG+9VzLQ==
X-Received: by 2002:a05:6512:ea5:b0:512:fc6a:2d10 with SMTP id
 bi37-20020a0565120ea500b00512fc6a2d10mr1487797lfb.40.1708913508068; 
 Sun, 25 Feb 2024 18:11:48 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:37 +0200
Subject: [PATCH RFC 01/12] kbuild: create destination directory for
 _shipped handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fd-xml-shipped-v1-1-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GCmbOiHpksQl5QzvCUG6WPQ7hoPhwGILSxcYlA8FkiE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NggplOAhkZ4TcIUVFZRYGYJgjLoTm1ot7+w
 zpS8LPTlAaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYAAKCRCLPIo+Aiko
 1bBlB/9thCMztpjZ24AQZfOl4nGcw36lRs6sD8zWSRDqcZ7DDXW88HukH6n9X4QEYqtIrmCv3Uf
 I2u2GjCLznZKSn0lsK6JVodcOS1pxZOr9aEG0RsVOgVGNdT0UiMqBHFMdLZOMEc40hTlNMc5KEp
 LbOvELeAMQ22xduaK228sjQs3A24dUtq19IdBx0pJYjkBqG3SYhQi0+M2PbsKpmZy5ByqiroHl7
 ymxm4UCKSgEmmzxWxknN6HoVtSeZlSsejTjfDKjcQeL0GWnhE52u1JA4aOPketCWodUKkwg3Kg3
 KVqi53EWoXeS+iQoxFilQyly44dJ9U1sl/RGFZ1K1CcWnviO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The driver might decide to put the _shipped files to the subdir. In such
case the cmd_copy might fail because the destination directory is not
present. Call mkdir -p to make sure that the destination directory is
present.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd5b181060f1..94373eeac420 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -297,7 +297,7 @@ endef
 # the copy would be read-only as well, leading to an error when executing the
 # rule next time. Use 'cat' instead in order to generate a writable file.
 quiet_cmd_copy = COPY    $@
-      cmd_copy = cat $< > $@
+      cmd_copy = mkdir -p $(shell dirname $@) && cat $< > $@
 
 $(obj)/%: $(src)/%_shipped
 	$(call cmd,copy)

-- 
2.39.2

