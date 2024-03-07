Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1903D875F67
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 09:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0E410FA42;
	Fri,  8 Mar 2024 08:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b="mNEOPKgB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CE010E067;
 Thu,  7 Mar 2024 20:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.com;
 s=s31663417; t=1709843069; x=1710447869; i=quwenruo.btrfs@gmx.com;
 bh=5Hupm3kce49/aay2KVr+fYLW3kZtpJnUrKktfknZEBU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=mNEOPKgBMKyumQyvo5DPFQT2iDocv+MuS1wvY8fYKL3GOUoSMK52OwmFFDarArvO
 sSClopMbzUHP9WXmj/ExMAlfGYtnKu3CEtjACoSdqE3yjb6/u7Tu8xRPSkKCeupC+
 v9q4SSrzyn7UDWtV1BDOZi9dUOYPYi5UzyuYEXQLeTFDBwyPA1fyjTQHiMj4YEzgM
 TKvzHDzzzYYZqlCq5sjnJ89TnVdU+5BB1/2/NDYqegUvm6u6ncm2iGRnxDkH0qhsP
 hdxecjgqk26ZEEYxxhUgdn2tfbKUSwgQQ0w4W8QL7j7NFDZiJu3AmR07/94ZSoEQE
 UvMuelz4aFUWiGoooQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.219] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MWASY-1rJdSA2QPK-00XeF0; Thu, 07
 Mar 2024 21:24:29 +0100
Message-ID: <9a0bff1f-d70f-4416-8f55-abca3d19410c@gmx.com>
Date: Fri, 8 Mar 2024 06:54:22 +1030
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master] BUILD REGRESSION
 1843e16d2df9d98427ef8045589571749d627cf7
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <202403080452.o04TWXOy-lkp@intel.com>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCY00iVQUJDToH
 pgAKCRDCPZHzoSX+qNKACACkjDLzCvcFuDlgqCiS4ajHAo6twGra3uGgY2klo3S4JespWifr
 BLPPak74oOShqNZ8yWzB1Bkz1u93Ifx3c3H0r2vLWrImoP5eQdymVqMWmDAq+sV1Koyt8gXQ
 XPD2jQCrfR9nUuV1F3Z4Lgo+6I5LjuXBVEayFdz/VYK63+YLEAlSowCF72Lkz06TmaI0XMyj
 jgRNGM2MRgfxbprCcsgUypaDfmhY2nrhIzPUICURfp9t/65+/PLlV4nYs+DtSwPyNjkPX72+
 LdyIdY+BqS8cZbPG5spCyJIlZonADojLDYQq4QnufARU51zyVjzTXMg5gAttDZwTH+8LbNI4
 mm2YzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCY00ibgUJDToHvwAK
 CRDCPZHzoSX+qK6vB/9yyZlsS+ijtsvwYDjGA2WhVhN07Xa5SBBvGCAycyGGzSMkOJcOtUUf
 tD+ADyrLbLuVSfRN1ke738UojphwkSFj4t9scG5A+U8GgOZtrlYOsY2+cG3R5vjoXUgXMP37
 INfWh0KbJodf0G48xouesn08cbfUdlphSMXujCA8y5TcNyRuNv2q5Nizl8sKhUZzh4BascoK
 DChBuznBsucCTAGrwPgG4/ul6HnWE8DipMKvkV9ob1xJS2W4WJRPp6QdVrBWJ9cCdtpR6GbL
 iQi22uZXoSPv/0oUrGU+U5X4IvdnvT+8viPzszL5wXswJZfqfy8tmHM85yjObVdIG6AlnrrD
In-Reply-To: <202403080452.o04TWXOy-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7Ulud7sLi7neGRg8fBjcgsjSyUNED5/sPPdzYy7SlSWitW7HV66
 7qtyG+6FZL0GNF1QbdNAdhv/KNl4/DGahPlXzIwQcdZZHP0BLroPg86gIFm/pMa/J58s7WY
 KuKgHQx3CxIOa2QZRYK9Tx4kzXkJoczenHElP/jKNRqBz837woY5YJNjxt36Ago7c4jyXsd
 AvJ32adWF9M0zgTncNOFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HllpuzOXalM=;TzPfIXOYrlm6AS5kwE1xxvgusJb
 ltBfS8J7lqCR1TopPVEsqrYc0NsHnlU6tCSR+UFyNfcpwdmxVzEjPHcoTGcC+fOrbqYnaRmbW
 mmKhW3lnnvq0MLtKVma98Z/+5NNe2uHMTriTBIeWfKD+JeSweURdOkW5OFe53q+0S6upwucH0
 mI/2Pbmd8ZlfrlXeczB2v2bYTWYUX6mXBKy8h+XdlwTN2SSlppDhcNrU1S07YPJTplctJGiko
 8GlhH81zU79x9NPgItptMajoxUDtC6L7fN0W+z7aV9pLIy0SOry+i/IqqCULNapokP+yFXexA
 YxhhvNvzE3eide+M4pKZ9YpDE/demThwLYb1IbQ1yf+CLGNifUTDNLxFRCZbziGrtvaEc41Io
 4+DNLogzhwqdnnEJNEYgEyzp5ZDQ3eVQF+gUCDhRAqtr60irPK6rW5p722ScDWH8hjd3Iw25B
 aHTWKKR1yOunnIzWOJTZSfgiqHItPhNJyP8U1BSNrd3sgcafMwSNP1u+5LCbzdPwoganEQZIw
 peuiN7RApJ4tFKo6PI4c0nrvet1bg15Go/9tWtoGTvctLLGQI3E47sqsf0RQaQNqoIZ+8rK0y
 Juu3wUB5ePmX7RM/Jlu5LPrRVvjKpN9syg3/wKSnpViD5noxmo5sW4S+x0D4mS4FtLXw9K9I0
 VBnpSn6pSYi+bCjMkeRRAQ7LPsDHEWQMr+VZ0NQn/eH2bRg2U+knni70WP417iWhO3bgjd7Z4
 F7w0lnA1rD2Sq/2hMH7qsbGi4C1b8YBNiglKSfWDUoFUM3P9mVgVSs+ZvKlJxiCxYTeDvaN2v
 59Afj4LfFt3PlXGB6ICNunFHTl7pfxbWFw2+kGDGXFUAk=
X-Mailman-Approved-At: Fri, 08 Mar 2024 08:24:25 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



=E5=9C=A8 2024/3/8 06:33, kernel test robot =E5=86=99=E9=81=93:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
> branch HEAD: 1843e16d2df9d98427ef8045589571749d627cf7  Add linux-next sp=
ecific files for 20240307
>
> Error/Warning reports:
>
> https://lore.kernel.org/oe-kbuild-all/202403071947.NUYuBx0G-lkp@intel.co=
m
>
> Error/Warning: (recently discovered and may have been fixed)
>
> fs/btrfs/extent_io.c:3246:26: warning: 'last_extent_end' may be used uni=
nitialized [-Wmaybe-uninitialized]

This looks like a false alert.

Firstly it only seems to happen on s390, which I'm not sure how common
it is nowadays.

Secondly fiemap_find_last_extent_offset() would initialize
@last_extent_end as long as it returns 0.
For <0 return value, it immediately goes to out_unlock tag, which won't
touch @last_extent_end at all.

Thus it seems to be a bug in S390 compiler.

Thanks,
Qu

>
> Error/Warning ids grouped by kconfigs:
>
> gcc_recent_errors
> |-- alpha-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arc-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arc-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arc-randconfig-002-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- arm-allmodconfig
> |   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am=
33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_re=
set()-instead
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arm-allyesconfig
> |   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am=
33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_re=
set()-instead
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arm-randconfig-003-20240307
> |   `-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am=
33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_re=
set()-instead
> |-- arm64-defconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arm64-randconfig-001-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arm64-randconfig-002-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- arm64-randconfig-003-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- csky-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- csky-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- csky-randconfig-001-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- csky-randconfig-002-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- i386-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- i386-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- i386-buildonly-randconfig-002-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- i386-buildonly-randconfig-004-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- i386-buildonly-randconfig-005-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- i386-randconfig-004-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- i386-randconfig-005-20240307
> |   |-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefine=
d
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- loongarch-allmodconfig
> |   |-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefine=
d
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- loongarch-allyesconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- loongarch-defconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- loongarch-loongson3_defconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- loongarch-randconfig-001-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- m68k-allmodconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- m68k-allyesconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- microblaze-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- microblaze-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- mips-allyesconfig
> |   |-- (.ref.text):relocation-truncated-to-fit:R_MIPS_26-against-start_=
secondary
> |   |-- (.text):relocation-truncated-to-fit:R_MIPS_26-against-kernel_ent=
ry
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- nios2-allmodconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- nios2-allyesconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- openrisc-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- parisc-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- parisc-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- parisc-defconfig
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- parisc-randconfig-002-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- parisc64-defconfig
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- powerpc-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- powerpc-randconfig-003-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- powerpc64-randconfig-003-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- s390-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- s390-randconfig-c005-20230325
> |   `-- fs-btrfs-extent_io.c:warning:last_extent_end-may-be-used-uniniti=
alized
> |-- sh-allmodconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- sh-allyesconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- sh-randconfig-001-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- sparc-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- sparc-randconfig-002-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- sparc64-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- sparc64-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- sparc64-randconfig-002-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- um-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- x86_64-buildonly-randconfig-001-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- x86_64-randconfig-004-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- x86_64-randconfig-012-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- x86_64-randconfig-013-20240307
> |   `-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefine=
d
> |-- x86_64-randconfig-072-20240307
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> `-- xtensa-allyesconfig
>      `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_rese=
rvation().-Prototype-was-for-add_or_start_queue()-instead
> clang_recent_errors
> |-- arm-davinci_all_defconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arm-defconfig
> |   |-- ERROR:__aeabi_uldivmod-drivers-gpu-drm-sun4i-sun4i-drm-hdmi.ko-u=
ndefined
> |   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am=
33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_re=
set()-instead
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arm-imx_v6_v7_defconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- arm-randconfig-004-20240307
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-di=
fferent-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
> |-- arm64-allmodconfig
> |   |-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefine=
d
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-di=
fferent-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
> |-- arm64-randconfig-004-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- hexagon-allmodconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- hexagon-allyesconfig
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- i386-buildonly-randconfig-003-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- i386-randconfig-003-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- i386-randconfig-006-20240307
> |   `-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefine=
d
> |-- i386-randconfig-011-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- i386-randconfig-015-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- i386-randconfig-141-20240307
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   |-- drivers-mtd-devices-mchp48l640.c-mchp48l640_read_page()-warn:Ple=
ase-consider-using-kzalloc-instead-of-kmalloc
> |   |-- drivers-mtd-devices-mchp48l640.c-mchp48l640_write_page()-warn:Pl=
ease-consider-using-kzalloc-instead-of-kmalloc
> |   |-- drivers-usb-dwc2-hcd.c-dwc2_alloc_split_dma_aligned_buf()-warn:P=
lease-consider-using-kmem_cache_zalloc-instead-of-kmem_cache_alloc
> |   `-- drivers-usb-typec-tcpm-tcpm.c-tcpm_pd_svdm()-error:uninitialized=
-symbol-modep_prime-.
> |-- powerpc-allyesconfig
> |   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-di=
fferent-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
> |-- riscv-allmodconfig
> |   |-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefine=
d
> |   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-di=
fferent-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
> |-- riscv-allyesconfig
> |   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-di=
fferent-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
> |-- riscv-defconfig
> |   |-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefine=
d
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |-- s390-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-di=
fferent-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
> |-- s390-defconfig
> |   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-di=
fferent-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
> |-- x86_64-allmodconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- x86_64-allyesconfig
> |   |-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- x86_64-buildonly-randconfig-006-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- x86_64-randconfig-003-20240307
> |   |-- ERROR:acpi_device_notify_remove-drivers-i2c-i2c-core.ko-undefine=
d
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- x86_64-randconfig-006-20240307
> |   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reser=
vation().-Prototype-was-for-add_or_start_queue()-instead
> |-- x86_64-randconfig-075-20240307
> |   `-- drivers-gpu-drm-nouveau-nvkm-subdev-gsp-r535.c:warning:Function-=
parameter-or-struct-member-gsp-not-described-in-nvkm_gsp_radix3_sg
> `-- x86_64-randconfig-161-20240307
>      |-- drivers-usb-dwc2-hcd.c-dwc2_alloc_split_dma_aligned_buf()-warn:=
Please-consider-using-kmem_cache_zalloc-instead-of-kmem_cache_alloc
>      `-- drivers-usb-typec-tcpm-tcpm.c-tcpm_pd_svdm()-error:uninitialize=
d-symbol-modep_prime-.
>
> elapsed time: 747m
>
> configs tested: 180
> configs skipped: 3
>
> tested configs:
> alpha                             allnoconfig   gcc
> alpha                            allyesconfig   gcc
> alpha                               defconfig   gcc
> arc                              allmodconfig   gcc
> arc                               allnoconfig   gcc
> arc                              allyesconfig   gcc
> arc                                 defconfig   gcc
> arc                     haps_hs_smp_defconfig   gcc
> arc                   randconfig-001-20240307   gcc
> arc                   randconfig-002-20240307   gcc
> arm                              allmodconfig   gcc
> arm                               allnoconfig   clang
> arm                              allyesconfig   gcc
> arm                     davinci_all_defconfig   clang
> arm                                 defconfig   clang
> arm                       imx_v6_v7_defconfig   clang
> arm                         lpc18xx_defconfig   clang
> arm                           omap1_defconfig   gcc
> arm                   randconfig-001-20240307   clang
> arm                   randconfig-002-20240307   gcc
> arm                   randconfig-003-20240307   gcc
> arm                   randconfig-004-20240307   clang
> arm                           stm32_defconfig   gcc
> arm64                            allmodconfig   clang
> arm64                             allnoconfig   gcc
> arm64                               defconfig   gcc
> arm64                 randconfig-001-20240307   gcc
> arm64                 randconfig-002-20240307   gcc
> arm64                 randconfig-003-20240307   gcc
> arm64                 randconfig-004-20240307   clang
> csky                             allmodconfig   gcc
> csky                              allnoconfig   gcc
> csky                             allyesconfig   gcc
> csky                                defconfig   gcc
> csky                  randconfig-001-20240307   gcc
> csky                  randconfig-002-20240307   gcc
> hexagon                          allmodconfig   clang
> hexagon                           allnoconfig   clang
> hexagon                          allyesconfig   clang
> hexagon                             defconfig   clang
> hexagon               randconfig-001-20240307   clang
> hexagon               randconfig-002-20240307   clang
> i386                             allmodconfig   gcc
> i386                              allnoconfig   gcc
> i386                             allyesconfig   gcc
> i386         buildonly-randconfig-001-20240307   clang
> i386         buildonly-randconfig-002-20240307   gcc
> i386         buildonly-randconfig-003-20240307   clang
> i386         buildonly-randconfig-004-20240307   gcc
> i386         buildonly-randconfig-005-20240307   gcc
> i386         buildonly-randconfig-006-20240307   clang
> i386                                defconfig   clang
> i386                  randconfig-001-20240307   gcc
> i386                  randconfig-002-20240307   gcc
> i386                  randconfig-003-20240307   clang
> i386                  randconfig-004-20240307   gcc
> i386                  randconfig-005-20240307   gcc
> i386                  randconfig-006-20240307   clang
> i386                  randconfig-011-20240307   clang
> i386                  randconfig-012-20240307   gcc
> i386                  randconfig-013-20240307   clang
> i386                  randconfig-014-20240307   clang
> i386                  randconfig-015-20240307   clang
> i386                  randconfig-016-20240307   clang
> loongarch                        allmodconfig   gcc
> loongarch                         allnoconfig   gcc
> loongarch                           defconfig   gcc
> loongarch                 loongson3_defconfig   gcc
> loongarch             randconfig-001-20240307   gcc
> loongarch             randconfig-002-20240307   gcc
> m68k                             allmodconfig   gcc
> m68k                              allnoconfig   gcc
> m68k                             allyesconfig   gcc
> m68k                       bvme6000_defconfig   gcc
> m68k                                defconfig   gcc
> microblaze                       allmodconfig   gcc
> microblaze                        allnoconfig   gcc
> microblaze                       allyesconfig   gcc
> microblaze                          defconfig   gcc
> mips                              allnoconfig   gcc
> mips                             allyesconfig   gcc
> mips                       bmips_be_defconfig   gcc
> mips                           ip28_defconfig   gcc
> mips                    maltaup_xpa_defconfig   gcc
> mips                   sb1250_swarm_defconfig   gcc
> nios2                            allmodconfig   gcc
> nios2                             allnoconfig   gcc
> nios2                            allyesconfig   gcc
> nios2                               defconfig   gcc
> nios2                 randconfig-001-20240307   gcc
> nios2                 randconfig-002-20240307   gcc
> openrisc                          allnoconfig   gcc
> openrisc                         allyesconfig   gcc
> openrisc                            defconfig   gcc
> openrisc                  or1klitex_defconfig   gcc
> openrisc                       virt_defconfig   gcc
> parisc                           allmodconfig   gcc
> parisc                            allnoconfig   gcc
> parisc                           allyesconfig   gcc
> parisc                              defconfig   gcc
> parisc                randconfig-001-20240307   gcc
> parisc                randconfig-002-20240307   gcc
> parisc64                            defconfig   gcc
> powerpc                          allmodconfig   gcc
> powerpc                           allnoconfig   gcc
> powerpc                          allyesconfig   clang
> powerpc               mpc834x_itxgp_defconfig   clang
> powerpc                     ppa8548_defconfig   gcc
> powerpc               randconfig-001-20240307   gcc
> powerpc               randconfig-002-20240307   gcc
> powerpc               randconfig-003-20240307   gcc
> powerpc64             randconfig-001-20240307   gcc
> powerpc64             randconfig-002-20240307   gcc
> powerpc64             randconfig-003-20240307   gcc
> riscv                            allmodconfig   clang
> riscv                             allnoconfig   gcc
> riscv                            allyesconfig   clang
> riscv                               defconfig   clang
> riscv                 randconfig-001-20240307   clang
> riscv                 randconfig-002-20240307   clang
> s390                             allmodconfig   clang
> s390                              allnoconfig   clang
> s390                             allyesconfig   gcc
> s390                                defconfig   clang
> s390                  randconfig-001-20240307   clang
> s390                  randconfig-002-20240307   clang
> sh                               allmodconfig   gcc
> sh                                allnoconfig   gcc
> sh                               allyesconfig   gcc
> sh                                  defconfig   gcc
> sh                        dreamcast_defconfig   gcc
> sh                    randconfig-001-20240307   gcc
> sh                    randconfig-002-20240307   gcc
> sparc                            allmodconfig   gcc
> sparc                             allnoconfig   gcc
> sparc                               defconfig   gcc
> sparc64                          allmodconfig   gcc
> sparc64                          allyesconfig   gcc
> sparc64                             defconfig   gcc
> sparc64               randconfig-001-20240307   gcc
> sparc64               randconfig-002-20240307   gcc
> um                               allmodconfig   clang
> um                                allnoconfig   clang
> um                               allyesconfig   gcc
> um                                  defconfig   clang
> um                             i386_defconfig   gcc
> um                    randconfig-001-20240307   gcc
> um                    randconfig-002-20240307   clang
> um                           x86_64_defconfig   clang
> x86_64                            allnoconfig   clang
> x86_64                           allyesconfig   clang
> x86_64       buildonly-randconfig-001-20240307   gcc
> x86_64       buildonly-randconfig-002-20240307   gcc
> x86_64       buildonly-randconfig-003-20240307   gcc
> x86_64       buildonly-randconfig-004-20240307   clang
> x86_64       buildonly-randconfig-005-20240307   gcc
> x86_64       buildonly-randconfig-006-20240307   clang
> x86_64                              defconfig   gcc
> x86_64                randconfig-001-20240307   gcc
> x86_64                randconfig-002-20240307   gcc
> x86_64                randconfig-003-20240307   clang
> x86_64                randconfig-004-20240307   gcc
> x86_64                randconfig-005-20240307   gcc
> x86_64                randconfig-006-20240307   clang
> x86_64                randconfig-011-20240307   gcc
> x86_64                randconfig-012-20240307   gcc
> x86_64                randconfig-013-20240307   gcc
> x86_64                randconfig-014-20240307   clang
> x86_64                randconfig-015-20240307   clang
> x86_64                randconfig-016-20240307   clang
> x86_64                randconfig-071-20240307   gcc
> x86_64                randconfig-072-20240307   gcc
> x86_64                randconfig-073-20240307   clang
> x86_64                randconfig-074-20240307   gcc
> x86_64                randconfig-075-20240307   clang
> x86_64                randconfig-076-20240307   clang
> x86_64                          rhel-8.3-rust   clang
> xtensa                            allnoconfig   gcc
> xtensa                randconfig-001-20240307   gcc
> xtensa                randconfig-002-20240307   gcc
>
