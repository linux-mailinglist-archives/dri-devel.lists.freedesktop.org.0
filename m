Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3774802FD
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 18:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617AB10E8F5;
	Mon, 27 Dec 2021 17:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 679AB10E8F5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 17:48:58 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id w7so5606899oiw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 09:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pEDTSevr8Wui7/9Ib0ms0N7Elw3SuXo4ylecnWyhlSo=;
 b=ehv/beOOjVHY0/sgKdcpY8YzavbZDivcQVdBoIeoRKI4qC8EayE8VBARAwiSsJBeMg
 Zz3lXu+y9k2nNSuIlCNv/KXJeQUZt+jBe9GlImPC6RkELaI4OwGtotJ8lJT4/RYUvXeg
 5Yx++5EIDR1wB7QuoetS4tNem0svdSDSCecLUq4Nl5eBOUOKs2Gs+UisJK8zu7iYw2pq
 PcDsXaJJl8yT+sBrdf2ZMSprNPKxdo/1kTE/fvwlcME88l50Ds0vKqwzoH4bPkfvnAPw
 BW+JRWfrn/ItjQte78Dwgt8Dko2eYYW3nLA+EyqURprwTeFBH4+RkctBrk7LJGBiMFCC
 vwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pEDTSevr8Wui7/9Ib0ms0N7Elw3SuXo4ylecnWyhlSo=;
 b=zDThyTcGb0nOwI1VsK3crWH9e4+LWTomXF2NTLCEjx9qAswt9cdCxhk43b0BV1kG2b
 nX0134R+I/FiI/O4YCh7sl97bv4Au3m96DBXEDA0TkDIWLxu77N3/z34fHIAncK/CGs5
 AuJw2v/VbyJrzwJQREctTjBrnWhQIgqDEwczzw8sURPHn8m06VLp87bMPmY42EWUqIi0
 5DujmPNZ2D/1FjYeMteBonrY0mx7rHPFD/adAKDwf66llepeCFMRX5f4ji23xbmbinf+
 QNjX0SOXTpKs3VA2IWXD8gkVBQYKqxKPSla19Yj1kCHgZwIUXeZ0zcoTbDPVXB0SzvBV
 R09w==
X-Gm-Message-State: AOAM5318oCxcOzf4XoewcnAqODv6OiwzJTJL82K89oYfrbD5CdqMBSne
 Zb5rPP7YbOaU3Ur5fBXoOaE=
X-Google-Smtp-Source: ABdhPJxb6+7biAtxOQefdtgXxvyx2b2YNDyhmSemqV7yYJxoDKcbxu7R4xufBgYDTWnPfrrEWMwb0g==
X-Received: by 2002:a05:6808:20a6:: with SMTP id
 s38mr14781112oiw.152.1640627337723; 
 Mon, 27 Dec 2021 09:48:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 23sm2931424oty.6.2021.12.27.09.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Dec 2021 09:48:57 -0800 (PST)
To: Niklas Schnelle <schnelle@linux.ibm.com>, Arnd Bergmann
 <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Ian Abbott <abbotti@mev.co.uk>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jean Delvare <jdelvare@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Karsten Keil <isdn@linux-pingi.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Kalle Valo <kvalo@kernel.org>,
 Jouni Malinen <j@w1.fi>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Hannes Reinecke <hare@suse.com>, Kashyap Desai <kashyap.desai@broadcom.com>,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com,
 Mark Brown <broonie@kernel.org>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>, Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Forest Bond <forest@alittletooquiet.net>, Jiri Slaby <jirislaby@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <281298ec-3898-9b02-1d92-66bf6df41170@roeck-us.net>
Date: Mon, 27 Dec 2021 09:48:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211227164317.4146918-2-schnelle@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-csky@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
 megaraidlinux.pdl@broadcom.com, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/27/21 8:42 AM, Niklas Schnelle wrote:
> Introduce a new LEGACY_PCI Kconfig option which gates support for legacy
> PCI devices including those attached to a PCI-to-PCI Express bridge and
> PCI Express devices using legacy I/O spaces. Note that this is different
> from non PCI uses of I/O ports such as by ACPI.
> 
> Add dependencies on LEGACY_PCI for all PCI drivers which only target
> legacy PCI devices and ifdef legacy PCI specific functions in ata
> handling.
> 

This effectively disables all default configurations which now depend
on CONFIG_LEGACY_PCI. Yet, I don't see CONFIG_LEGACY_PCI added to
configuration files which explicitly enable any of the affected
configurations. Is that on purpose ? If so, I think it should at least
be mentioned in the commit description. However, I think it would be
more appropriate to either delete all affected configuration flags from
the affected configuration files, or to add CONFIG_LEGACY_PCI=y to those
files.

Guenter
