Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 223135523AB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 20:16:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8547710ED3A;
	Mon, 20 Jun 2022 18:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEBF10ED3A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1655748957;
 bh=IRsReQcPvKjGuOiWZ/naJXtB5sl9AWyUBgzpYTxhbu4=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MpChZBAWOnKxGAjsdfSCjFh/gS+GTAFDKiwYXwYJAlHPLUPaZG6FHf3igR/s9RvC0
 JmkGFg2SzjQNrBff06GdWIu9DFQjbxDT6i9M3n5t3dgNSZTHH+rxsTE6i07afeLq0p
 KPBapCFQaZDQpD1B14JLAelnUzGIrkOc/6PhXWx0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.174.149]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5VDE-1nbB703cd8-016vo0; Mon, 20
 Jun 2022 20:15:56 +0200
Message-ID: <4bf0f587-e03f-60bb-806d-383cdab8f67a@gmx.de>
Date: Mon, 20 Jun 2022 20:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/4] video: fbdev: offb: Include missing
 linux/platform_device.h
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 manoj@linux.ibm.com, mrochs@linux.ibm.com, ukrishn@linux.ibm.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, tzimmermann@suse.de
References: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oJ9D9uGth3QBUylu+JFhLcVTIwUeAyZlFlYU4v/OPaS0ZpMihid
 tFsd2Tanp1YkXXsADmZD7gloGpa+E8c77bFVGDTOIbSoHVGGXqjDnhlG9X2kTmyAlcnkiUl
 YaAKGLHLr/7Cwe1Lwdry13RBpDCqRwRDdC+6HA3J7Kwgih+MFmqOSJeeQQotfiAjelWovxP
 NrTUJ0YmY4qRCYYTkWkIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3vwy0K/BsAQ=:mVmzG3FTCEVF3YJX5VmLFq
 Kbv0n9xBZ6oUg98dEQxL4XTvzFNHHEGeN3hcL6indwAgqvhjioXSbhbKWULn00ypejKFc1iXd
 JOslbeYH6NjU8rKb0MOlREPzpm3pqldRQiGRb/oOkVvf11r6NeKbHvT5Ae49+2NT5r5gXGpRS
 eWlFFRvp/ZrxeWFs85bNA241DQbVyAEWidEJXm9VoLHEx9iEm+G/Je3W1TvgHUJEyE9cxZ3NX
 3zLLLHjPv0Llp5WKUlkxtPMVqsOwMRF9lA96B0oPljvv/u0yfM7BJEoasOA+b60Wt9c6QVX37
 QhuQNtCKZD38TlS5W3KzUCz2HqFl8hSFaZx1qpL3mjJlcqlvvc234e7nparz+irI/oyK9dcWM
 ZetxeGVX79OIMe8HkkKVu1XZTHU0KwCdMHLgMo5XX4JflfFMifb1v1V2G+oO666w7H20jAend
 I8p7k78nHtJNJ+7pf/3fUF28i0tNq6gzXwFVffQzK7lmML9K/dfQJJ+uL4nt4yo3ba52/awdR
 yH8ge1cIV9TSL4D9wyXN02o1d++3z57DXeW/qZXGzve0MQyhLWLafNsa9jvpzAK85hcXwzaNl
 ieRnoqKRsknQDnbVwPPoIALxDUhUYu0kwIZC+nsX6CiTxjRfBKeDH0/WWuUjG1JQzu2kBcJ09
 bdiuWvYdpgDF+bute0DrVmYipy4qLrBo+1xsP5SVLeZYa4LgQvPTFbz2PfOsulplzlYxeZ4/Y
 hlW2ILy5JIyow4X1B5T4uryx4ZAPsJuWVlsD31x6HqOLtqkc49D2nYiIaCN8yN5iO76fdtsHh
 SuZ7lMlmo3UmIVLzhh8dy/TJvIJ91eW+jhA3hwV6fqnIpzTuuaXiNvozdUzfeSdws/2kfanWx
 k8Rc6XE8UTjCH/8nv8IR4kBcd+W3aTJCTXY/ocolP5FuGgw/RJAuLetxI+lpCtU1es/cJmgIi
 i/duuVuvcwrWKTHqLJNNTizAP8Cpm9VTyZlmn0C+FpT0vu3CAFMtFSshelmvdS5OKdxI/C+00
 Gnv4LClT5oFI0QNeO8MI6jnR51W6lHXSXswDav1aKaHZwiAzNIlYuAzEsKrhho5aJ5t2IdziY
 62A5GzemI0vJpp5H5uncv1hbDRM7FWxSZquInJjY6wCVwRD8+5eLTsdoA==
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/11/22 18:50, Christophe Leroy wrote:
> A lot of drivers were getting platform and of headers
> indirectly via headers like asm/pci.h or asm/prom.h
>
> Most of them were fixed during 5.19 cycle but a newissue was
> introduced by commit 52b1b46c39ae ("of: Create platform devices
> for OF framebuffers")
>
> Include missing platform_device.h to allow cleaning asm/pci.h
>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 52b1b46c39ae ("of: Create platform devices for OF framebuffers")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Helge Deller <deller@gmx.de>

I assume you take this through the linuxppc git tree?

Helge

> ---
>  drivers/video/fbdev/offb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/video/fbdev/offb.c b/drivers/video/fbdev/offb.c
> index b1acb1ebebe9..91001990e351 100644
> --- a/drivers/video/fbdev/offb.c
> +++ b/drivers/video/fbdev/offb.c
> @@ -26,6 +26,7 @@
>  #include <linux/init.h>
>  #include <linux/ioport.h>
>  #include <linux/pci.h>
> +#include <linux/platform_device.h>
>  #include <asm/io.h>
>
>  #ifdef CONFIG_PPC32

