Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 930003055C1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEDB6E7EA;
	Wed, 27 Jan 2021 08:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB8189C84
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 21:17:36 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id j13so21512378edp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 13:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nELwzlUlP6axkorz2djr4guRUf+IWYEa8K0PWf9nTOU=;
 b=MI5Yn4GQix/Onk1AXDBpkLu8gGJ0+ZJPmdZJTwQ+kS11QNftnWwldp71R0ffDbjgXX
 voO4MnYL/dzs58rhk5fBEN6adzDnXRGW837juTSJNruW7OZEYjPc56ZtRTEke1r4PyjX
 WSWvv66Vf2X++L3OgVDMtnMQ9x2VWL0J3B7pXqo4VRcb7bgBa7fZmEwWHNAKY6B4AEgU
 QHdEwNehuqYfA7crHzh5zAR6PtxMSWxg3tobFX8qm9djD6gaLWSrs0LPCjNfKgqmpGvT
 TcaLkqPqk3lwS7Nn4qEcNmoK8NpuXEjQUfMSwdwjQE0mHddJYwAyd+u9JbpZVuydv6WZ
 pWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nELwzlUlP6axkorz2djr4guRUf+IWYEa8K0PWf9nTOU=;
 b=G5zC9UAmwvRE2oskeyS7RprWl1lleCzd8kgRyeN5Evl5p0SuowuIVw95Kv5TIQodMA
 474Z6mt/90ReTqeZyww4QeYdZL/heXtT/nnpFdUsfN3L8cCTOaT0ZCBDTQh204iCjbfw
 KrzWKQa1pIue2gUf3HvPoSlSkC4HaTURQ5/Ap9NH5ibV1YiJcMK75u+vv34apunn/Mn/
 Mw3rhm1tcvU/7/u9nzKxIU3tG5cP4R/NlOD2P2XCMo19ihI0KaOCBC9ZwSceiwfmUosZ
 UpDkizQetFYDMTWTnPRkBIJfcyPxKsmflUQR4D/839C/haeGeqRSgTYMSX6iVvLHHXCk
 7jnA==
X-Gm-Message-State: AOAM530QHINX/YS43x5NOUKafJjBv4nnqN1xOp0BnIJhYmdF1wwp6OuL
 NVFJyvwUOg5DENKRlomVuaU=
X-Google-Smtp-Source: ABdhPJy4wQRLKh/Cy7gtx3UaZtRIBsQTsVIk5N8CGxrOkT2rebKaO5+ZA7CUxEbx0O9LEX4QoSSfSg==
X-Received: by 2002:a50:fe85:: with SMTP id d5mr6304033edt.140.1611695855329; 
 Tue, 26 Jan 2021 13:17:35 -0800 (PST)
Received: from localhost
 (ipv6-64fbc1442191a03a.ost.clients.hamburg.freifunk.net.
 [2a03:2267:4:0:64fb:c144:2191:a03a])
 by smtp.gmail.com with ESMTPSA id p3sm13208836edh.50.2021.01.26.13.17.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Jan 2021 13:17:34 -0800 (PST)
Date: Tue, 26 Jan 2021 22:17:23 +0100
From: Oliver Graute <oliver.graute@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1] drm/panel: simple: add SGD GKTW70SDAD1SD
Message-ID: <20210126211723.GA17512@portage>
References: <20210110153532.GA7264@ripley>
 <CAOMZO5C_hDWeVrCh7k+3OiA0jhQfawhGWE6hxnnFn=wA+dkTGQ@mail.gmail.com>
 <20210110200606.GD7264@ripley>
 <CAOMZO5DJUm4zutTB1oi5M0zj4_PFZEAbGzX6_LUAkX_dvEz=Qg@mail.gmail.com>
 <20210116124856.GA3406@portage>
 <CAOMZO5DKann0ojZrhjyXOqrRq9owtgrrZTGwttD_bU0-KO=aBg@mail.gmail.com>
 <20210125212917.GA4177@portage>
 <CAOMZO5DiTDQneYMtNBDpyqtYUYJ3AZ_fqWNSyfxWB5AfaNfULg@mail.gmail.com>
 <20210125221701.GA20107@ripley>
 <CAOMZO5A99AJ9NVUmbFr3pE2jxXnQnGNZ+00LHtBTtG3f2mye8w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5A99AJ9NVUmbFr3pE2jxXnQnGNZ+00LHtBTtG3f2mye8w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
Cc: David Airlie <airlied@linux.ie>, Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/01/21, Fabio Estevam wrote:
> Hi Oliver,
> 
> On Mon, Jan 25, 2021 at 7:17 PM Oliver Graute <oliver.graute@gmail.com> wrote:
> 
> > I would prefer mine, because I got a wrong colored penguin on bootup
> > with yours :-)

The wrong colored Tux is caused by the bus_format:

.bus_format = MEDIA_BUS_FMT_RGB888_1X24,

So I assume I need another bus_format here.  

> 
> I have originally passed .bpc = 8, but looking at the panel datasheet,
> this should be:
> .bpc = 6 instead.

 yes this is right. I found it too in the datasheet. I'll fix it in next
 version of the patch.
> 
> In your patch, you pass the timing parameters three times, but they
> are all the same.
> 
> Usually, it is meant to be: minimal, typical, maximum values.

yes because on a lot of entries there is just the typical value and no min
and max. But not on all of them.

Best regards,

Oliver
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
