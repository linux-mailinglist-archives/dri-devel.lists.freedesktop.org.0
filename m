Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A42402D6
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B437D6E3C6;
	Mon, 10 Aug 2020 07:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698E76E121
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 19:48:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v9so3413374ljk.6
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 12:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/OAIwEYgb5EsnCOJBCBI53WQmoKNdPN9sFAT/HuBiGM=;
 b=rA/hxPg/cBBsL6bAS+rNWvYhRtIbOW7C8M0vmi2SgNiJ54zvP65TKyIbqD1hsHvkvS
 U7BsWvNlW0fM2g8crodJORaa+6xrZO4LAIxF70NhlT4aniLWsOt0YlH+H0rMWD5HVDjp
 e1z4CwOZtvwMokZdQ/+VXZFL5W6Br/QZsLGZ2kee1o1cxY3jJYjniQRvHWr2N8a6u1Ye
 gO5m4DCTLEyQREynj8UgTn4yeIpXn3G5IARwAXYRfTC1XCvskkeqBJzmjuzGTxE1bfA3
 EolmpKhPAKVepeb0TamsuYYEtxZEIk55G2gnn+CVXK/aFlXWvjlFJKBjFwsuU5mh13MT
 zvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/OAIwEYgb5EsnCOJBCBI53WQmoKNdPN9sFAT/HuBiGM=;
 b=eaxz+sg2kHWtgFLk0FJNaEqD6O4FrZGmx1jK6kgZK1WGe9Jx/ytXRH4x12MA3F853S
 eJDITgZP2zNnYoJAmbCP3qEvLC3zRAmPQ1sbDiDj6GHBKwmlunlUMyZ+k8vz8fmfvlUQ
 aboiPZO9qVPuFMKTtpgQ2mKtzHCDg+WefnhOamKAnUSx7pvhD1xf7qeZF1DTL1V6Qg1i
 THgB05hHShlkvPO0DvcpVsdVbNC7S62ZZCmVxeOYCIVq4bUvmbFAKW8Hw25Cx/Im4c46
 N4Wc9Xzq5LZlrO0p2DhDg/B9H12Hk3JL6XKcCn2QP6q7slIhO8GFkKXOBZFeq4hJatV5
 sMSw==
X-Gm-Message-State: AOAM531ArNtWS/oFFEK7QJhM7BdOGolexFARtSi2r/oXMINqGqQXs67e
 ZCL7SbKyRtxmuA2eabEFcng=
X-Google-Smtp-Source: ABdhPJzDPKqMkNqMCDgRhnAMLxrvo+wEVw3+nGA9tP5kHBSzcsRls18yvJQ+ewft2ZoRvQRTWzs36g==
X-Received: by 2002:a2e:b689:: with SMTP id l9mr6614535ljo.393.1596829690811; 
 Fri, 07 Aug 2020 12:48:10 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:445c:7ae3:e9a3:2354:9467:4eca])
 by smtp.gmail.com with ESMTPSA id
 k4sm4171586ljc.50.2020.08.07.12.48.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 12:48:10 -0700 (PDT)
Subject: Re: [PATCH 5/7] ARM: dts: r8a7742: Add DU support
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <e67a94e8-c9ed-dc9e-cab8-453a09441bcb@gmail.com>
Date: Fri, 7 Aug 2020 22:48:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807174954.14448-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: devicetree@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

On 8/7/20 8:49 PM, Lad Prabhakar wrote:

> Add du node to r8a7742 SoC DT. Boards that want to enable the DU

  Both "du" and "DU" on a single line? :-)

> need to specify the output topology.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
[...]

MBR, Sergei
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
