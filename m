Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E49B21E425
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 02:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AE56E840;
	Tue, 14 Jul 2020 00:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658CA6E840
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:00:35 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v8so15467353iox.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 17:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HcVlx3cR7khqkWWGJ+LiqzhfLBQSCOJE5FEqXVNq8Vg=;
 b=hTne/QE0K58dmbZiBaef8WQYiXlqy+Kl8QO1BtjR7uAzjf/pG7gw6tnWZwGmD1tBzb
 MNKQD2nB4rLIDoPRouyajGZHyJsZxGJHe1U2qi3lxAm9rz5YdWWDpe2UTubAx6BnarwG
 TYaHmRo3FWRFgmuNdSQ/mJoehW9A8CtsHpaoFa8ILl0mzVluHdf2xQOGHmfVQiMT3RGo
 cdM4tyQTLVvJPA9b0IBMyAtTI9QkiI614+GsUJLL0Aa/ipinKq/mZD2a8QBxz2k+KQdU
 dX+Mve2cuJY3x3xZ798xCIUxz9BeDZn/aTAh9GoAoxRk9PWrTIEcShC6KsEBly3VACIy
 6M3Q==
X-Gm-Message-State: AOAM531DWJ1Rh+96GCzQQD/o2WjoU6FFXG6j8WKRjJDefeZFsm651moQ
 4wPWknYj0SQ/lHNtx5Jtag==
X-Google-Smtp-Source: ABdhPJztNZI9s7ao+xl33WqViPfvZFK/U14n+YkWPfYxZTtVi4c6PBICgy8Gcdi2t6uYmkbgXy8yqQ==
X-Received: by 2002:a02:694c:: with SMTP id e73mr2960425jac.17.1594684834795; 
 Mon, 13 Jul 2020 17:00:34 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id t83sm9192280ilb.47.2020.07.13.17.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 17:00:34 -0700 (PDT)
Received: (nullmailer pid 963353 invoked by uid 1000);
 Tue, 14 Jul 2020 00:00:33 -0000
Date: Mon, 13 Jul 2020 18:00:33 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: media: renesas, fdp1: Convert
 binding to YAML
Message-ID: <20200714000033.GA963323@bogus>
References: <20200621004734.28602-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200621004734.28602-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621004734.28602-5-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 21 Jun 2020 03:47:30 +0300, Laurent Pinchart wrote:
> Convert the Renesas R-Car FDP1 text binding to YAML.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes since v1:
> 
> - Update MAINTAINERS
> ---
>  .../bindings/media/renesas,fdp1.txt           | 37 -----------
>  .../bindings/media/renesas,fdp1.yaml          | 63 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 64 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.txt
>  create mode 100644 Documentation/devicetree/bindings/media/renesas,fdp1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
