Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E61C2D18
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 16:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D336E183;
	Sun,  3 May 2020 14:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AFF6E183;
 Sun,  3 May 2020 14:50:02 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id k18so9703921ion.0;
 Sun, 03 May 2020 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1Ggi2tOtn6fWjPzvZwzQsgJOov1/FsKi8Om8sDMRcA=;
 b=HxvGAhT9OTNgDUFLYzZZRcoKMfhGjPBshUnyOSIlMXSNcv9h4/Oz/o13+7VqT8UxVr
 GLfT479WXZaLdb87jHp9szW1ydM+olqSwgfBXwJ/1wmNMXmE0eBqXLRAO4FvulgdYqmW
 OqykNoHblX1DfvOOlq1bWLPODvfKm6n0lvVq5BSgvedpNbZ5xaGzPHcNW/2sEUN26Mtt
 vGNHfaV62vuJTeeqDlXRNnLOMKS0dsoNIiO4FxiI6Uy+y5A6x/8Hx5JZWzTdryi0MqLC
 6EEGCwRbLB1XNl4ntFaKq2KatDVLf0NPst2/NeJErdUgW4GqlCVe6u01dG5Jh5Xxt0yp
 GcuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1Ggi2tOtn6fWjPzvZwzQsgJOov1/FsKi8Om8sDMRcA=;
 b=UWaQ7VuaPRQD1OEBHmG28ndzWdEqqyufdNfkKsZBglTyDxUPqHMcpeSLNUO5dL41Zv
 zdttS1msasVYVhPXjVU0F+2p/TYoF73Px9YSJlpzOmcROPxDvTuGIP9jyCx5T0Zq9CPa
 8qOu+bF7zsnFcFFq27K041FBwjIkQ6meGlHP1iwmNZgvLnUsnV7qb2iR4xqpKFLw/fWR
 tgod/waYqzJnOEuopy+/DHSZUMrAVlnHbbcfpESgDZZANDl1LaEBXh+Ey2SMPkLukr6q
 JsmTgPZg8Qn4SSctH3+e6SKgOiHNjJgM1o3YSUZttfFBRbsmOoyE4cM7g2VaG0KOShmJ
 /iqg==
X-Gm-Message-State: AGi0Pua0ksfDeRI5x7WdeFN8TDnrJRR7fyRtMVAaVKRHHJ4fPmEEa3gE
 6CWrx4NAzk1VMEGtZee+0t7UL3r+vzX5zpuC0jU=
X-Google-Smtp-Source: APiQypLbcKgX3zhmAur79Vn+sc0A1kneTzi/1Vo1IHxvDZMcqShXBChBJ4soO8y6+dAipoLOjkTP4D38bcG/hwiWprc=
X-Received: by 2002:a6b:dd16:: with SMTP id f22mr11782741ioc.178.1588517401325; 
 Sun, 03 May 2020 07:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-5-frieder.schrempf@kontron.de>
In-Reply-To: <20200430124602.14463-5-frieder.schrempf@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 3 May 2020 09:49:50 -0500
Message-ID: <CAHCN7xJ=srZxygtG6hW_+us=qH1heY-k=EosavYH9tDk-KG0Bw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] arm64: dts: imx8mm: Add GPU nodes for 2D and 3D
 core using Etnaviv
To: Schrempf Frieder <frieder.schrempf@kontron.de>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Anson Huang <Anson.Huang@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 7:46 AM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> According to the documents, the i.MX8M-Mini features a GC320 and a
> GCNanoUltra GPU core. Etnaviv detects them as:
>
>         etnaviv-gpu 38000000.gpu: model: GC600, revision: 4653
>         etnaviv-gpu 38008000.gpu: model: GC520, revision: 5341
>
> This seems to work fine more or less without any changes to the HWDB,
> which still might be needed in the future to correct some features,
> etc.
>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
Since not everyone uses the 3D or 2D, would it make sense to mark them
as disabled by default and let people who need the 3D and 2D enable
them at their respective board files?

adam

> 2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
