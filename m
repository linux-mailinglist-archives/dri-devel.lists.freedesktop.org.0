Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5AC1271D4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 00:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51A6EBAD;
	Thu, 19 Dec 2019 23:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123056EBAD
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 23:51:27 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b18so9402352otp.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 15:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OjXAZ2TKobv9yoEqrbBdYh7biWU4O3QAfvZyc2J4dWM=;
 b=YUynQNkrcd7u4udWbnZFW1tOuojYNH62sCOFm0idxEECax+D6ChKsBY+atbyWDZLTj
 lPGuioLuH7HTHhkOU1MVtT8fvJITQx/nH1SjRmRd8bw+ESqu/FhGFuvYAAmrGNr0a9T3
 aDld6r2+926x9qEMx5EjSpfAiaeHKiKf9OxyHTgSYk1OhEHKfyLIjgAqzjZPjeouV+8A
 5SjPgE0JtaiVy5ebH/97urQVztU5jk4pWKOhpt1jNOEnI+LFEsTjQR3KQge54KfPsNOm
 JxeKWjiasMop78oeK3Hf/ZgLMqjpDQJf4MN03I5gpb37WEimiT0AbdVF5tx5xm1x5ZTy
 xZ6A==
X-Gm-Message-State: APjAAAVlcpL4ot2tdbVMIGZ79ErSuzzkIruHJULV6EF2xPgmZKpa4iCM
 WOSDGdtepRcMpnhcRIXPtw==
X-Google-Smtp-Source: APXvYqzaPjmepv4a279sIAA5ICFmA0B7tF34IOFNH9fz0KHDHD1DOST2PYO1ecY606VakqN6h26qsA==
X-Received: by 2002:a9d:20e4:: with SMTP id x91mr11381091ota.335.1576799486409; 
 Thu, 19 Dec 2019 15:51:26 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net.
 [184.205.174.147])
 by smtp.gmail.com with ESMTPSA id y24sm2577643oix.31.2019.12.19.15.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 15:51:25 -0800 (PST)
Date: Thu, 19 Dec 2019 17:51:24 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add vendor prefix for Satoz
Message-ID: <20191219235124.GA2960@bogus>
References: <20191213182325.27030-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213182325.27030-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 13 Dec 2019 19:23:24 +0100, Miquel Raynal wrote:
> Satoz is a Chinese TFT manufacturer.
> Website: http://www.sat-sz.com/English/index.html
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
