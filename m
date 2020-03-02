Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6606176350
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 19:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6973F6E5D4;
	Mon,  2 Mar 2020 18:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601B46E5D4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 18:55:05 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id v10so352690otp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 10:55:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uWS79D/0ZLL0e/s1oUout/5p5w20WIJlmrFZDFmjEe4=;
 b=YXhlZ047VjIkIS626T+x8G0z5DO2cfOXhOwQRTFtSmfygrALrt0DETwFlCfvdA36NP
 CNAwKEh5mSXSsf6c+MhD3usqDW1VHiDBnrpsF/0tXPDp08RkIMkCOctsUDp4EWn6dQbp
 6QiqpPTpsQpFSX546nFK+5OwlK2+Ndd2seaRuq0Xq1Ye07/NlJyWE+VgMEuqAHmiRvDn
 KTr9SahKCU8I0ZayaZQwAm3eyjAZaKKbBFvSE6tYDdCMPwSt7nei+VZmU3IYZO8Y+Jri
 sX0qUjUyDmt0MJl9BTU8PquJAdueZAHbRm1M21RbuoMxOTwmT6ecc5ES7D0K8aiywPfb
 qLPA==
X-Gm-Message-State: ANhLgQ1c2JrS9eCAtwN0mwwIUJujWdykGstEykKl8E1TnDS1chlpM9Gd
 zCCspUtqlgg87MZwd0KA/Q==
X-Google-Smtp-Source: ADFU+vt2q1Eduhwf/PVNlCpfWIgnuXW91fEn1d40UCOZdJUjlTwYuw6/BVVLBJDj89BnwQ28P5Q3Hw==
X-Received: by 2002:a05:6830:60b:: with SMTP id
 w11mr468468oti.350.1583175304589; 
 Mon, 02 Mar 2020 10:55:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n64sm6852351otn.35.2020.03.02.10.55.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:55:04 -0800 (PST)
Received: (nullmailer pid 994 invoked by uid 1000);
 Mon, 02 Mar 2020 18:55:03 -0000
Date: Mon, 2 Mar 2020 12:55:03 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT
 Schema
Message-ID: <20200302185503.GA32613@bogus>
References: <cover.1582913973.git.hns@goldelico.com>
 <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
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
Cc: devicetree@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, kernel@pyra-handheld.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-gpio@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, letux-kernel@openphoenux.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Feb 2020 19:19:26 +0100, "H. Nikolaus Schaller" wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
> 
> Add DT bindings for the LCD controller on the jz4780 SoC
> Based on .txt binding from Zubair Lutfullah Kakakhel
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.example.dt.yaml: example-0: 'jz4780-lcdk@0x13050000' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1246780
Please check and re-submit.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
