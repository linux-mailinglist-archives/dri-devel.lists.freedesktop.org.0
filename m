Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FC52D1C1C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 22:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB6C6E8C7;
	Mon,  7 Dec 2020 21:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37B6E8C7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 21:32:00 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id h18so9967958otq.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 13:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YdIJ0cVvLcaZw842WkJYzbX/9+PQf7WPJ2/asgIqMAo=;
 b=GiPpKC1Jw3qn37F0txHm9HYxMywfblmryYMWejOacMkJPukgx5cOGjEGp1OKzuBVdy
 ytLsOknfec6WkFh1jkrKK7JlLfyosivHphzn/uAE3cTmZ4QZWDvI7fMH5AaUG790p1La
 t1Y4wWezqg3K27CLxWCs//V2izQFIMMdy+pKKR0LxNTSED0vgdhMkkHpqt2ETYdlDIsG
 z4/33Dtjmj6xRJxMuUJKV13RLcp/QBpGNKkcrcbE9XG/5JqxB1dQ13r1Jw3sVOjketg4
 P92EJtjhTNfy8CFJRrX1WJ8arKpZNU253iLDe2iQxAkTr5qZR+htCS7pow6YPAhdihIp
 l0dA==
X-Gm-Message-State: AOAM5332UWAsOBoGI7alGvyHX72QnD6v2MCT8FvgkNNfCMv5PJDvAq5X
 l4806CJKulnyZsU/Nl1s6Q==
X-Google-Smtp-Source: ABdhPJynUSeUJfvdffPqKHkyHxZkw5osI59qNIBgtb8M/rH1rJtmbMdqsrprbx/fJ7YQRpvK4fK1Uw==
X-Received: by 2002:a9d:27a7:: with SMTP id c36mr1402179otb.59.1607376720005; 
 Mon, 07 Dec 2020 13:32:00 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u10sm3439121oig.54.2020.12.07.13.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:31:59 -0800 (PST)
Received: (nullmailer pid 863978 invoked by uid 1000);
 Mon, 07 Dec 2020 21:31:57 -0000
Date: Mon, 7 Dec 2020 15:31:57 -0600
From: Rob Herring <robh@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v2 5/6] dt-bindings: vendor-prefixes: Add ys vendor prefix
Message-ID: <20201207213157.GA863327@robh.at.kernel.org>
References: <cover.1605688147.git.agx@sigxcpu.org>
 <efa9b6da947e0cd87ec47c1a211690045304989b.1605688147.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efa9b6da947e0cd87ec47c1a211690045304989b.1605688147.git.agx@sigxcpu.org>
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
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, allen <allen.chen@ite.com.tw>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 18, 2020 at 09:29:52AM +0100, Guido G=FCnther wrote:
> Add prefix for Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
