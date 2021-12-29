Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67DE481013
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 06:36:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2029310E21E;
	Wed, 29 Dec 2021 05:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6ED10E21E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 05:36:03 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so18936275pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 21:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LCWTLU499vgUIibOB7RC/Lf29OvyjLAfzziGpa9pprc=;
 b=UHG2Wr/bUh9+RG3z6/wLDKvolZg27kHxzETT+w1PyYUO0M/sEDfnfDaXFK1/Fe+EgQ
 EPmePdb9FtgIXRoeOSmBlqYRDCHjdVhn5U3zfC73wvgE9tX1KbrJH1jfp4d9PlDGU/XQ
 WN/0TGLd8cDAoQlePh8eUjttGzfucKl1hZPjfzGSC0zx4iosSx7jERUbeqLcHxD1Cxfo
 lcoILVOjDWFPER13QQjV2dxLhxvnSaNP2wnyqahYu84szMUf1fvfvQZr6YYtlaI5wHbk
 RCareXx3mv9jLuqA1CDDe+stKGjbppVraM/vQFxLpzLq2BY9y8oEUIp+Z/T5s5sQNUgp
 GWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LCWTLU499vgUIibOB7RC/Lf29OvyjLAfzziGpa9pprc=;
 b=zlHGh2mpQaUPrvzVWnrArCFHE6VetIhrmOo/dsepZx4M+Ju3z2mmqA0GJgxaXQchoD
 kIJcdTC8Co1LO87e1Ryly39O68gIF2JyzPtUION2KrpBdRWxCFkrleuGB5Nb5t32v6Xz
 7F9JefWDHyFa0iQsM3UOSF+HnfWYJpBw4mMAN8nBNeiw8WM5dUVb90mJrF2n30HG0Vw0
 g5EjOMp2g+x3j5SKKBdcEGrf8Tz+RH98qbPDNCcbnruci7IQ2feBJP3MwIW+QYN3NSVM
 y8Hp7rSsFNabRdJ3KTxpu/i58PrsGioGxvfzcRxK4CEWepRyce4fwBJ7Sz1MyvZ3KjQp
 vQ5w==
X-Gm-Message-State: AOAM530CSEfuRi/EN8mXHFe/LLkvYNiTec62X98z5kagPhcxnvm+2Od7
 2KJoQuGXIf9ZFkAGFvfbg2ymtA==
X-Google-Smtp-Source: ABdhPJwI3ybkjKJD6RZt2826LHFESA/M3BbWEhFyh7OncX6wgaoW14cNyMMqRzWh+NFFFl1UtWzOSA==
X-Received: by 2002:a17:902:6b02:b0:149:7c20:c15b with SMTP id
 o2-20020a1709026b0200b001497c20c15bmr13898631plk.173.1640756162651; 
 Tue, 28 Dec 2021 21:36:02 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:4dea:2b20:ea89:724b])
 by smtp.gmail.com with ESMTPSA id w7sm23509460pfu.180.2021.12.28.21.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 21:36:02 -0800 (PST)
Date: Wed, 29 Dec 2021 13:35:57 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Subject: Re: [PATCH v2, 01/12] media: mtk-vcodec: Add vdec enable/disable
 hardware helpers
Message-ID: <YcvzvXQ2Yov3OSvZ@google.com>
References: <20211228094146.20505-1-yunfei.dong@mediatek.com>
 <20211228094146.20505-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211228094146.20505-2-yunfei.dong@mediatek.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 28, 2021 at 05:41:35PM +0800, Yunfei Dong wrote:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> Lock, power and clock are highly coupled operations. Adds vdec
> enable/disable hardware helpers and uses them.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
