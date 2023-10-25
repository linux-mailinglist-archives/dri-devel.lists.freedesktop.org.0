Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA37D710B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4C810E5CA;
	Wed, 25 Oct 2023 15:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD88410E5CA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698248310; x=1698507510;
 bh=s3OSHMGsk9AbX3O1+PeWpTjfY8iogU36oS0MMtzUkOM=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HEtXXiSuOfPyu+UaMN6/UV6yrkpJKijbGZmGy3nURSVNze4dfy2e3RthAItSDlvwg
 4h90fPnJKu12fpPltCZKYZfw5bIINOVaXM4qBkH7mwBxzUJ4Ncjlvgfg+EQGBoBUNj
 GWr1x3gL0K3kZ0qd+jB+GIXt833zMOEnT0aiCVjZkVHUjNvTW2Oo9CHyZT0sjsc1eL
 637VWZ8aIGINmiLfyCcHYWgDQaupiBrfRLAv0aRQuHpLERitwggQH1WtF5xJC4ndzr
 KFO4FuWJKWiWC2iFhXN9NyPrQct6vv3sJEOZ76zIxNofGuckAkOk0SmdEcP+cfdY8s
 9YnsG/jJRnKYg==
Date: Wed, 25 Oct 2023 15:38:10 +0000
To: Keith Zhao <keith.zhao@starfivetech.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 3/6] drm/fourcc: Add drm/vs tiled modifiers
Message-ID: <nPUOGd5_-QuZTUXhGdmJ03Bri58JI0SeYVcBLnJG4aFuqobd5i1RUBVoi4CNP3VGg5oBdz5LAGdwHERxtMwXJyHPyVxJz4UpiBuFiA5NlkA=@emersion.fr>
In-Reply-To: <20231025103957.3776-4-keith.zhao@starfivetech.com>
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-4-keith.zhao@starfivetech.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Shengyang Chen <shengyang.chen@starfivetech.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, Jack Zhu <jack.zhu@starfivetech.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Would be good to have an overview comment to explain how bits in the
modifier are used and how everything is tied up together, e.g. what the
type and tile mode mean. Also some docs for DRM_FORMAT_MOD_VERISILICON_TYPE=
_NORMAL
would be nice. (If there is no other type, this can be removed, the bits
will be left as zero and can be extended later if needed.)
