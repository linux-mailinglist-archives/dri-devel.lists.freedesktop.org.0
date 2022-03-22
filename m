Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582924E472C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 21:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F7610E0ED;
	Tue, 22 Mar 2022 20:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C220010E0ED
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 20:03:19 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so2804969fac.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 13:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Fq1z4Ed84ZuWdkW2m9jYI7sM6QJam+q9K1arrVbgWws=;
 b=2/tCiPUtgFMBiQ/l+Xmo8Fl8wZrWgfiFRn1+Gxug7x53wV4CgWPezFEFkYLxKkca4Q
 AdXgBlfEdrsjLN0lwJwH9JxplfXnQXK/6rqQklw8064TcvKsdHa8hiv/26V/ulXeWZgI
 x0iDrai5ecQJ/EtjPPnkk04WpuMV70X88h/IYJ2bOz9oWjhCyMgvSVzmmyTCZ+5e4SmZ
 R4jmQQvswexCKHKp5bAlKl0fEs4vo8FNX+zOMM1cHXPzBx3mOyH7EHkygtK3qDE0mynV
 g2cLQrZA/NXdHR87WqIkxaWEBQda1llQeabtpGc2xTF4ESgq8dgpgjFGPrppL5qAR8Rp
 Vs0g==
X-Gm-Message-State: AOAM533uXWs7RalM/YdH/u1Qi0C6iBTXRepBIPVe6c88JmdrgtxpCPTT
 Ki43CUuDu9VUQg+ch6VP4w==
X-Google-Smtp-Source: ABdhPJy4AIzdw7CM09sm8WiJu7yAMWYZnT7kqu9E09l5bnyx+c0wfi4rPWwDeKMKI6b9WUwXAQwTQQ==
X-Received: by 2002:a05:6870:b52c:b0:dd:ddfa:3161 with SMTP id
 v44-20020a056870b52c00b000ddddfa3161mr2430238oap.61.1647979398908; 
 Tue, 22 Mar 2022 13:03:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 21-20020a056870115500b000dda3a0cb91sm3110524oag.54.2022.03.22.13.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 13:03:17 -0700 (PDT)
Received: (nullmailer pid 2415318 invoked by uid 1000);
 Tue, 22 Mar 2022 20:03:15 -0000
Date: Tue, 22 Mar 2022 15:03:15 -0500
From: Rob Herring <robh@kernel.org>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v11 5/7] dt-bindings: display: Add Loongson display
 controller
Message-ID: <Yjorg4taoTVAr8ML@robh.at.kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-6-15330273260@189.cn>
 <YjkITWpbnCmhKaX+@robh.at.kernel.org>
 <f7eb61bc-6784-c77a-083f-7408c0a17e05@189.cn>
 <66ae2436-aa86-f583-85b4-d652273188e9@flygoat.com>
 <629311ac-f847-dd57-689e-eaa97aae8480@189.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <629311ac-f847-dd57-689e-eaa97aae8480@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 devicetree@vger.kernel.org, suijingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 22, 2022 at 09:54:08PM +0800, Sui Jingfeng wrote:
> 
> On 2022/3/22 21:08, Jiaxun Yang wrote:
> > 
> > 
> > 在 2022/3/22 2:33, Sui Jingfeng 写道:
> > > 
> > > On 2022/3/22 07:20, Rob Herring wrote:
> > > > On Tue, Mar 22, 2022 at 12:29:14AM +0800, Sui Jingfeng wrote:
> > > > > From: suijingfeng <suijingfeng@loongson.cn>
> > > > > 
> > > > Needs a commit message.
> > > > 
> > > > > Signed-off-by: suijingfeng <suijingfeng@loongson.cn>
> > > > > Signed-off-by: Sui Jingfeng <15330273260@189.cn>
> > > > Same person? Don't need both emails.
> > > 
> > > Yes,  suijingfeng@loongson.cn is my company's email. But it can not
> > > be used to send patches to dri-devel,
> > > 
> > > when send patches with this email, the patch will not be shown on
> > > patch works.
> > > 
> > > Emails  are either blocked or got  rejected  by loongson's mail
> > > server.  It can only receive emails
> > > 
> > > from you and other people, but not dri-devel. so have to use my
> > > personal email(15330273260@189.cn) to send patches.
> > In this case you can just use your company's email to sign-off
> > code and sending with your personal email. It's common practice.
> > 
> > If you don't want to receiving kernel email in your company mailbox,
> > you can add a entry in .mailmap .
> > 
> |I'm using `git send-email -7 --cover-letter --annotate -v11` command to
> send patches, it will automatically sign off patches with the my private
> emails. |

I think that is only if you set your git config author to your private 
email. Pretty much anything git might automatically do can be turned 
off.

Rob

