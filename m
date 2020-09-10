Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D8B263DA9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 08:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9AB6E095;
	Thu, 10 Sep 2020 06:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBFE6E030;
 Thu, 10 Sep 2020 06:53:15 +0000 (UTC)
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93A222078E;
 Thu, 10 Sep 2020 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599720795;
 bh=/LOePKGDUR83plqAhx1ySvpBeTmOBTt4AYD41Ar10p8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3Jk9M7ZKtsnsBd892ykDqq6ldjJyX23IqJ7DyDWgKOR2vkDHWpTUx3L4W3ZSGRl8
 gbJ25CK/q4T0DRgLEQdFDMLfOBf9AoSauHV2UkWklXje0SfXK1Ub2yM0Bl5ncgFE73
 tRqSbJwVN+gRudxLpTtOTt3VxbQSMkA19oVYS08w=
Date: Thu, 10 Sep 2020 08:53:12 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [trivial PATCH] treewide: Convert switch/case fallthrough; to
 break;
Message-ID: <20200910065312.GH1031@ninjato>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
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
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
 alsa-devel <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, Kees Cook <kees.cook@canonical.com>,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org,
 storagedev@microchip.com, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="===============2126759720=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2126759720==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline


--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index e32ef3f01fe8..b13b1cbcac29 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1785,7 +1785,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		fallthrough;
>  	case PCI_DEVICE_ID_INTEL_82801CA_3:
>  		priv->features |= FEATURE_HOST_NOTIFY;
> -		fallthrough;
> +		break;
>  	case PCI_DEVICE_ID_INTEL_82801BA_2:
>  	case PCI_DEVICE_ID_INTEL_82801AB_3:
>  	case PCI_DEVICE_ID_INTEL_82801AA_3:

I am not the maintainer (Jean is) but I suggest to drop this hunk. The
code is more complex with multiple 'fallthrough', so this change alone
actually makes the code inconsistent. A rework would need a seperate
patch.


--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZzVQACgkQFA3kzBSg
KbYNuA//cymFe0KsFqywRHv3eBWJhoqwvWN2Xhwrx5/b6N3kkKGTo61aOo1ZI2gU
55rQoGusy8OzGXaxlyhNS8Ea9ztPZc/tHEohOHKPYr52ErUMXlbMo3I3q7sZAZEI
O/bRlnPKUCKqKOpZBin0ri6NE3FNYybTW30HgIk/LFUeCuaup10cUcxCmPfXHlNc
M/2M2tBVyyBOqlVVsPxIfEZ4jGDaikxt7mBZDj4QMJnivnuMFuuz8U7gYzkXIHfO
4ahGx+dBLCCInwFNFjEIPr+biq6Bgt/Vl9bbgN/BYbzdgbbJcikEhWHd9FxEoxQ5
Y4M6/HxLDuCwTLIoFHjVifsFHK4Emk5ECc0xBWjHu3CJDunZSmy6yS5gbD1BrstW
Djf0Ue1kyqnVPBDKE0EwFmwz1z1V14bhhXVC1fkiJjTpYRA6g3zMwH1oan6XIbGj
v4OuWFDkQLEfzCCBIASGS849HtQ4rNafKxX3KQ3qxngh7XBrK7X92SLf3qRJurdt
h5Ozd/zYDzyKQ1nOf/XWAOP5SKZH2ANjTrFKgIZE8MRkTmbzrlZkCnDnFD0pKPlB
Z9h9uPZ7kifAejwaRPfsTu6/B9XJafMKfLa3hKTg2kgO+p67ItBEQ0W8wrXLE1/1
c5FW5PqdkjKnx/9yUqosjEsHV2goh1guE4cziLkF1pZXcrElbtk=
=ZP3J
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--

--===============2126759720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2126759720==--
