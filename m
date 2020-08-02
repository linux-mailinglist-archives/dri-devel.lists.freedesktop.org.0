Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF6723A0C9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD3289126;
	Mon,  3 Aug 2020 08:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5586E136;
 Sun,  2 Aug 2020 18:27:35 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id o18so11282325eds.10;
 Sun, 02 Aug 2020 11:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ec+QZPQt4BI+HNScgjvbhAWx5U5Q2eYvCkS354frzh0=;
 b=YtJLT8D3c903d3hsfGfmpRep4DyZJhzRytGWo/UssPWnsu4TDB7JZAkT1sTJMmJUH+
 bq5rDlN4QtT+Xdj0JNzjtQ2QqTr2pVyC4JOlcnf9bRRCSyXgovVOl9FdgJQfsiPfkKzY
 DWsX6GX1lxDOlwpnwJCtIh+GQ6RZkI/pzRvVJxUc5FGTjx+jay8s+7hZFlw796rU78Gc
 7K1ApoysPqm8FRM+jQOGIRHengeFZ6xNP8mOw9mf8ONnQV8kOLpUVEJO7EpYgXqjQKbR
 ZXY6Otij2DqA3PujrgbIOxTi9tcd/lHDFFPdppv1+HoL/eGjvY6ERK9eoJvC1OZ061lc
 FmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ec+QZPQt4BI+HNScgjvbhAWx5U5Q2eYvCkS354frzh0=;
 b=jMoH4ePuuo/5sbYX7An7IZpgdWtSuqgZYdzMiwUBcLwLwMZo7Mys89CGNgQsz0+zP9
 Ug8bNFyHLAZ3Q5GLhPeYbajKs/Cf3YUlZMrD+QJi9efq9Th57gJFllRsNXYka0z/R14Y
 l3+Mxx7qvZlxESy9jJqGtRt/589krbGyla6pto5u9UlRD7m2A1f9GMa9JfrP5QzTF1CR
 Ja49Y7PLmBOd7vFe3WWhZbcN5aubK8TVaJywWpY46MVPgnn21c9oZpIhRgRN2N8cpk2C
 u//GqGaTttwDw2iye0mvh1yz93yfEs/YYe80F3e6Kw1IC//wfgJdoDnT7/t7aWUr6YsS
 Wh+A==
X-Gm-Message-State: AOAM5316qRn86m1nzNH6XoRv8QE7T5LWmI72qrfDN5zeEzcihjMYpxPk
 /u/OVy/Tms3YQNhvIvFVqdw=
X-Google-Smtp-Source: ABdhPJzPSVl/d4yXQb9tARqdTsGpw8tzteKDCnrRiPQdt2yWNobLwsKDJ8Loc5jmq7ZA1MaLrCqHCQ==
X-Received: by 2002:aa7:c9c2:: with SMTP id i2mr12251380edt.326.1596392853909; 
 Sun, 02 Aug 2020 11:27:33 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id b9sm2015326ejz.57.2020.08.02.11.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2020 11:27:33 -0700 (PDT)
Subject: Re: [RFC PATCH 00/17] Drop uses of pci_read_config_*() return value
To: Borislav Petkov <bp@alien8.de>, trix@redhat.com
References: <20200801112446.149549-1-refactormyself@gmail.com>
 <20200801125657.GA25391@nazgul.tnic>
From: Saheed Bolarinwa <refactormyself@gmail.com>
Message-ID: <b720aa44-895a-203b-e220-ecdb3acd9278@gmail.com>
Date: Sun, 2 Aug 2020 19:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200801125657.GA25391@nazgul.tnic>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-rdma@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Joerg Roedel <joro@8bytes.org>, linux-atm-general@lists.sourceforge.net,
 helgaas@kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Wolfgang Grandegger <wg@grandegger.com>, intel-gfx@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 skhan@linuxfoundation.org, bjorn@helgaas.com,
 Kalle Valo <kvalo@codeaurora.org>, linux-edac@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/1/20 2:56 PM, Borislav Petkov wrote:
> On Sat, Aug 01, 2020 at 01:24:29PM +0200, Saheed O. Bolarinwa wrote:
>> The return value of pci_read_config_*() may not indicate a device error.
>> However, the value read by these functions is more likely to indicate
>> this kind of error. This presents two overlapping ways of reporting
>> errors and complicates error checking.
> So why isn't the *value check done in the pci_read_config_* functions
> instead of touching gazillion callers?
Because the value ~0 has a meaning to some drivers and only
drivers have this knowledge. For those cases more checks will
be needed to ensure that it is an error that has actually
happened.
> For example, pci_conf{1,2}_read() could check whether the u32 *value it
> just read depending on the access method, whether that value is ~0 and
> return proper PCIBIOS_ error in that case.

The primary goal is to make pci_config_read*() return void, so
that there is *only* one way to check for error i.e. through the
obtained value.
Again, only the drivers can determine if ~0 is a valid value. This
information is not available inside pci_config_read*().

- Saheed

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
