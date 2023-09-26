Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA717AF3EC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 21:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767CE10E151;
	Tue, 26 Sep 2023 19:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE9D10E031
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 13:47:00 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-41368601e92so48062371cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695736019; x=1696340819; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HoEvBtWhyms91Wk0krqHULnviTnuUoiVYm+WuAD7to4=;
 b=AXb+WTs7kY6ly8CIbKvo4GSaChFcyqAbWloHQessZOVJwWkCeZ6ovS0aJhAaKlKxqJ
 FlV0i0qeQ1x4tq7tHI++PBI8aw0bNd1IofYPsdzVWzQRnywr1sMCCUv/Ad+n0tOqs2as
 glhA0CGb6EgHwshxe/Wce1/hiDSLNH4Pkh9SnbNizdDatikUn5pxkrWwrf5X6V/t9PPa
 KKSA5aHdeEpzZU9bnhgxS+/xKneMXXzfOg+6oSoSFlcDqA5vS9o6rq6DJ1xLxP8jP3Ba
 ashUH7f+aOFuNtJOvm4AJ7toxdXwi001ta082nM6u8YomwvVdeEHr7+y7OzJzYEICdg7
 JMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695736019; x=1696340819;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HoEvBtWhyms91Wk0krqHULnviTnuUoiVYm+WuAD7to4=;
 b=Iz2Vgoci6cR1UsSJNp0KszsfuN/Dawc7LlVqrR5xwIlpQoKIYWvd0brfhgru3QEOYV
 VMB/XJrZpNto3Ha7O5g1YiA5scPAKyGI2rg6ij7ayFTBpgpdijjTzfvst7zBZ4w4hbKF
 UvW45Ql8Y6/O0l+eoASr6c1cHbpBZMHhkvoKx+mL6CDMl3XCOG8WRlfWjSHmxuQs4OdE
 VGNL37rq782h9HybNoRdkoTq8uccAAEPwDZKJF3sQnydQAlPy9ffl3SVH3wnIlM6VgUM
 xK3aRcYpPMUJs6/zjP9dT7QBDIgZTdfcvSCAjDvuuaQMzoI/CSh/BNaPle5eCkEc1pja
 B7Fw==
X-Gm-Message-State: AOJu0YwhvGgVpufAqF99gFKc9dUP5YqVrHhPBTWQTcyR2jTTf5g+jaux
 cWGZZxa4T1Rbyp/0qbPjzMPsSnr5v6i9uF4RPD4=
X-Google-Smtp-Source: AGHT+IGykYB5UPsLfPurQ8CQ1MugnOgrqtxif6zRnr9Gfu3wgFJzWTtijtU76jcjvMCgb/r3a6fl0Vhvn4akvSD98b0=
X-Received: by 2002:a05:622a:1495:b0:419:50c7:f6de with SMTP id
 t21-20020a05622a149500b0041950c7f6demr1629063qtx.39.1695736019585; Tue, 26
 Sep 2023 06:46:59 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Cormier <jjcf89@gmail.com>
Date: Tue, 26 Sep 2023 09:46:48 -0400
Message-ID: <CAEzfL1kA5PMgPRFoce6R3Oi9fr0d2eN17sPqenWwKhqy3KLw_g@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm/bridge: tfp410: Add i2c support
To: Jonathan Cormier <jcormier@criticallink.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 Sep 2023 19:13:53 +0000
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
Cc: devicetree@vger.kernel.org, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 neil.armstrong@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Mike Williamson <michael.williamson@criticallink.com>,
 Laurent.pinchart@ideasonboard.com, Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

How do I bump this patch submission?
