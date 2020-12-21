Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01502DF7BC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 03:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2436E44D;
	Mon, 21 Dec 2020 02:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3B06E448
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 02:53:12 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id h22so10632363lfu.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 18:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xCNFr4f3wVLInkwunk0vPKzuNbBepmIVeNw0P+U3M9A=;
 b=VksI3NEOSkKqUkDp5XoS+Pc7qx4lix7zHmpaCN3NQsLoJnwpRWAVa0EiCbzt+ekfxL
 H8nJd7hpXCeHjSot6gTuJ0b7/DatxNBbWHhfSfG6SAFIKYBWucS02bGZH5PN2AAr92pu
 FLUjWmT0STdudujHInM7NS8j717BLqcnay4pZWgC7TGSEbioCQiMxXQbCQShMmo3Pyuq
 NeG0DqGZtejdg59Il8nyGpZlqZH7DCTw+3Q3bG19qIzAQQEIWtOkStByUQc32peBMvFQ
 EH4UXWjPgFJtykZ4dEs0sE44MMsdQmXZispUfCvfOpdymrWrJSLG/cqR2Nr7wZ6cAddE
 4hVQ==
X-Gm-Message-State: AOAM533eqOYgG9JwLE75XEyPerP1o7Mi53/Mmj6n3ZG5JBUsruKTJP6G
 QmIVOVjxoBjH37l2m+qch5vzhJXQ0ZZfHg==
X-Google-Smtp-Source: ABdhPJwYML8K2VqllHNljwSobrInkmUHIFGEkrCfCW1FvX1JpfJ7/ak2IJixI3GuAhnWacmO72aIJw==
X-Received: by 2002:a2e:b550:: with SMTP id a16mr6466811ljn.408.1608519190580; 
 Sun, 20 Dec 2020 18:53:10 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id e25sm1891112lfc.40.2020.12.20.18.53.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Dec 2020 18:53:10 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id l11so20237000lfg.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Dec 2020 18:53:10 -0800 (PST)
X-Received: by 2002:a2e:8e62:: with SMTP id t2mr6426100ljk.463.1608519190106; 
 Sun, 20 Dec 2020 18:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20201220195005.26438-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201220195005.26438-6-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20201220195005.26438-6-laurent.pinchart+renesas@ideasonboard.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 21 Dec 2020 10:52:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v65F+g7YZE5rbOJK2eNztu_EvhO2V3Vz-nUA+AxT55qsRA@mail.gmail.com>
Message-ID: <CAGb2v65F+g7YZE5rbOJK2eNztu_EvhO2V3Vz-nUA+AxT55qsRA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: display: sun8i-a83t-dw-hdmi:
 Reference dw-hdmi YAML schema
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/SHMOBILE ARM..." <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 21, 2020 at 4:03 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> Replace the reference to the DWC HDMI text DT binding with a reference
> to the YAML equivalent.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
