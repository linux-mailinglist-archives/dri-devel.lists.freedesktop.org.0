Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2728CF1E9
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 00:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D82910E9A4;
	Sat, 25 May 2024 22:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lAff1vYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0193C10E9A4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 22:49:40 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-df78acd5bb6so692587276.3
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2024 15:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716677380; x=1717282180; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GtkdsUBL3WYVixfcgRmj95EW2aGE3JRk0sx7/4uHNMg=;
 b=lAff1vYvrYY8W+EL84N94rNdxWXHkBL/fetH/Y065jRO+zPIET4D2ec08bD2knf5JS
 Y4Lja14Ihwsf1S47R3GZxI/P5bWp9O+cm6lK70/cdV4LzYuiGfjCs4bhz82LhqLO5bOO
 ytlfG2r0PbR2vqI0s6mdkMDm5mxYqMxDMl+ydCHA6UPXLeOgzz2Vg5nXN22T/K6Z+2ns
 wh9tlPt4ngFTd4XuZP21FiDLuHT8+RKHRzq7Jb7y1jJBFXIT2Ro9mzn3NS3lhsz8jogQ
 B101ckj3iiV2YJPZmv0/ztfp6gzQLFN9p5Z2yo8wk9GUryo5nH/jf0JoUfxBRaWlkWRW
 nrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716677380; x=1717282180;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GtkdsUBL3WYVixfcgRmj95EW2aGE3JRk0sx7/4uHNMg=;
 b=mtvkFzB1xyQPjfLXh8S65iyJQxjyOO437enJboXqM+MDsfrth1A0lyMf2h0RPzws+l
 oTtpW/ECAaopWZPHv/XDhV+eJo8g5LoyEODM1jFoQs5fUiskeAUi7zXSlU7m55ixOjrE
 pwaWEq7O0Zwdvg7mQfJY280wX9YvbVGivYbzrlJI4a0T/pmJqOzPbGqIwrotrFTXyKje
 xbunirP26ULAPW+Lysv2I9fXyBUDZQTKxzASw3r7/fSacASm7HYncjPbSB5u8BU9q1+j
 Kc8aEkBOXWWfn+wNAoUcpo+utmiMcGouSdHHbtiVzAJ5qQPTeHEQLBqsS11r5duXaL9Y
 cI8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF+Cz9bvhzqmHiOBy/huEKjWUzm0Q3eBjBZG5JnCRWTQC7TMYxdqJWlKrQb6Le8pTiDmkP13ylw6mMXPbvQjkqqyddEBVFdhT2Cw8YLvck
X-Gm-Message-State: AOJu0Ywk8QGPbemylV85UJjT6C8V8/qzXNXoqSaUqUoqpXDeVaRqB1oz
 s9XQ/C/sutyYoFd6QudP/coynBtic3uH69QydY2mYtdUMDMz5O0knaXfRgqeDzWmug6SQ5oNiKA
 hS56Z88k2B+NKa3TGp4pc8PlBSH4=
X-Google-Smtp-Source: AGHT+IHaKdY6tU3uqHg9hlv4eo4aw+cXWjnMktMaBBhmEJF9s5u0yAmveyHlzKk2D4HTIKNsATsTtn5pab61VRlZzpE=
X-Received: by 2002:a25:9391:0:b0:df7:6bc3:3e73 with SMTP id
 3f1490d57ef6-df7722166b3mr5173057276.48.1716677379702; Sat, 25 May 2024
 15:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240524103506.187277-1-ryan@testtoast.com>
 <20240524103506.187277-2-ryan@testtoast.com>
 <20240524-purveyor-outlying-5201f700a56e@spud>
 <a7363cd2-4e2e-4894-8a16-f1913927e332@app.fastmail.com>
 <20240525-velvet-citable-a45dd06847a7@spud>
 <bb8b54de-c894-4fcd-a2ea-89b22cdb3a47@app.fastmail.com>
In-Reply-To: <bb8b54de-c894-4fcd-a2ea-89b22cdb3a47@app.fastmail.com>
From: =?UTF-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Date: Sun, 26 May 2024 07:49:28 +0900
Message-ID: <CAG40kxGEw4AyHk3P_dixKRdesGT0pLtMfpYcCCTbVGUs2NMD-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add WL-355608-A8 panel
To: Ryan Walklin <ryan@testtoast.com>
Cc: Conor Dooley <conor@kernel.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chris Morgan <macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Ryan,

How about to use "anbernic,rg35xx-panel" ?
It's not generic though, some other drivers use similar strings already.

Regards,
kikuchan.
