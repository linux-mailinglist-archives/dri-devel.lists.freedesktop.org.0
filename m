Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1C80A8F5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90F310EAC6;
	Fri,  8 Dec 2023 16:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969B910EAC6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:31:31 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-1efabc436e4so1333036fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 08:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702053091; x=1702657891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L0dh91LsH3FMgzR6j6ESovfFZbs4+hPOeOOy5RhBvXI=;
 b=BW1NQ+q+s91oq2fR63PpZ1fFE5rzqZRhhMg4zhZClyw0YbqupATHivf83QfF3TPJW7
 CgKe5oqywt0+/H0niFB8vRolFzH+4lsNlmUn5qo+srHy3jPJZexDbw4rlEPujwge1gdU
 ijpRSKZMtlh05LTJBz4WtLwUTf44vnC6pbx76Z1A4TxXBc3bNFzh9egFKJbuUiquyKsY
 HeuUqDgmMGB2tsIHdvv6KCig3gk0mB5sNfQE0FNxaJtEZh81ZCYNMEaoat80mEYnEOX6
 5W7nGYjj/M1MYoTeaJZ2RlPkcWaOkL1WNRzMlGBIYKavubLSk4OEfxauGm95t07wTTON
 eDGg==
X-Gm-Message-State: AOJu0YzXLfyhbTqwQLoUD9tSRi3i9efs2d1+0LZF2qbOhqMn9hcVhLeq
 V/nTIEYNaQVycDo1+NRCcg==
X-Google-Smtp-Source: AGHT+IHDm3wqp2WeSg6dUcKIT7qXKxWAFG2zul4H7tfMEgrUVi5XlJJQvhg6VUWNouCkEz0LkhH29A==
X-Received: by 2002:a05:6870:700a:b0:1ea:c913:3494 with SMTP id
 u10-20020a056870700a00b001eac9133494mr394403oae.6.1702053090816; 
 Fri, 08 Dec 2023 08:31:30 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 pv21-20020a0568709d9500b001fb4dcb74ebsm455362oab.54.2023.12.08.08.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:31:30 -0800 (PST)
Received: (nullmailer pid 1679055 invoked by uid 1000);
 Fri, 08 Dec 2023 16:31:29 -0000
Date: Fri, 8 Dec 2023 10:31:28 -0600
From: Rob Herring <robh@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [v3 1/6] dt-bindings: display: Add yamls for JH7110 display system
Message-ID: <20231208163128.GA1659919-robh@kernel.org>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-2-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204123315.28456-2-keith.zhao@starfivetech.com>
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, suijingfeng@loongson.cn,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, xingyu.wu@starfivetech.com,
 jack.zhu@starfivetech.com, palmer@dabbelt.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, william.qiu@starfivetech.com,
 shengyang.chen@starfivetech.com, linux-riscv@lists.infradead.org,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 04, 2023 at 08:33:10PM +0800, Keith Zhao wrote:
> StarFive SoCs JH7110 display system:
> dc controller, hdmi controller,
> encoder, vout syscon.

What are yamls?

I prefer not using 'yaml' as yaml is lots of things that are not DT 
schema.

Rob
