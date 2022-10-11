Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D27BE5FAFF0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 12:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518A010E4E9;
	Tue, 11 Oct 2022 10:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A14410E4E9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 10:00:42 +0000 (UTC)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B9iM3q008462;
 Tue, 11 Oct 2022 10:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=cDUY+1vkbBQhdXB58PoxjcuGNo/DQDfRq3ZaWdWqAzc=;
 b=OOL8Hxcl0CKggxHmxcmT0PdgQBUgq70AseSjBOxMElBjpC3YsyKSp0LsFe55kHAJxmP/
 P3Jz3ag1O2AUkeUOaghVX6JDJ5kM0YJ7sL5PwnHUI6Ma39FfAvDjkjUnaxQ+dIXxKdyD
 0UJEGZXrJzQKMLnVPW2vlNCgGVAfoSIsQ+WhotQC4kiRmGWKHnjea50FzdBUAJ71FJc+
 ha+oihFj3Y0sg1dbtCOh0rA793pGDPp0NNreqW6HwCNbBoPf1UwfbXpi/ZMgEAcXPr4L
 jGojWsVXNUI21pC2RMzUsTcR7A1Cv0qDFAHlZVwNEMYKhUUdOCyqynChy69sy9YVbhbH 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k54d0kknr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 10:00:28 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29B7spN5026272;
 Tue, 11 Oct 2022 10:00:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k54d0kkk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 10:00:26 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29B9ok2w003853;
 Tue, 11 Oct 2022 10:00:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3k30u9c3m9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Oct 2022 10:00:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29BA0LdC58196252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 10:00:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32F1DAE051;
 Tue, 11 Oct 2022 10:00:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26CF8AE053;
 Tue, 11 Oct 2022 10:00:19 +0000 (GMT)
Received: from osiris (unknown [9.152.212.239])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 11 Oct 2022 10:00:19 +0000 (GMT)
Date: Tue, 11 Oct 2022 12:00:18 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v6 5/7] treewide: use get_random_u32() when possible
Message-ID: <Y0U+sluE4MidMk8M@osiris>
References: <20221010230613.1076905-1-Jason@zx2c4.com>
 <20221010230613.1076905-6-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010230613.1076905-6-Jason@zx2c4.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3pMFFvEysNa_wNbSt0Vlrry7CHQANLe-
X-Proofpoint-ORIG-GUID: 9Pz4WXqTZkXGRUv-u8RjmFHok1WNz2gs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-11_03,2022-10-10_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 spamscore=0 mlxlogscore=530 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110053
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 x86@kernel.org, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com,
 "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 linux-media@vger.kernel.org, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, Yury Norov <yury.norov@gmail.com>,
 Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 linux-nvme@lists.infradead.org, loongarch@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Chuck Lever <chuck.lever@oracle.com>, linux-crypto@vger.kernel.org,
 Jan Kara <jack@suse.com>, Thomas Graf <tgraf@suug.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 10, 2022 at 05:06:11PM -0600, Jason A. Donenfeld wrote:
> The prandom_u32() function has been a deprecated inline wrapper around
> get_random_u32() for several releases now, and compiles down to the
> exact same code. Replace the deprecated wrapper with a direct call to
> the real function. The same also applies to get_random_int(), which is
> just a wrapper around get_random_u32(). This was done as a basic find
> and replace.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Yury Norov <yury.norov@gmail.com>
> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk> # for sch_cake
> Acked-by: Chuck Lever <chuck.lever@oracle.com> # for nfsd
> Reviewed-by: Jan Kara <jack@suse.cz> # for ext4
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com> # for thunderbolt
> Acked-by: Darrick J. Wong <djwong@kernel.org> # for xfs
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/s390/mm/mmap.c                            |  2 +-

For s390:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
