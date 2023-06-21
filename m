Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A01473981F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3190410E4E3;
	Thu, 22 Jun 2023 07:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED9710E46E;
 Wed, 21 Jun 2023 13:06:21 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230621130618euoutp029d7307487d761f7bf2f8f6f0c9e5bc6d~qrmmZaJYP1283412834euoutp024;
 Wed, 21 Jun 2023 13:06:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230621130618euoutp029d7307487d761f7bf2f8f6f0c9e5bc6d~qrmmZaJYP1283412834euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1687352779;
 bh=tF4riIzozstFHcZHBtz5SQAzztgzSEi85C6+BMxI57A=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=KizIn4h/+VubKpimOPqcdjHWTOSNrdxhq52NIdlcN6uvcXLAB6nFiyBh7t4SmSiCP
 td604+vg7J45oRN7XVDY0MruktIM6Tfp+rbOoX3PpG3N0t8hckrvJWga2W8NV3jyeY
 H1l5Lg0B87tZSR6VD/1dW5vkoQMqYyIu+p+NXDVs=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230621130618eucas1p24a0ecfda837a4bd159368de20c0d1f69~qrml_A2lL0200602006eucas1p2B;
 Wed, 21 Jun 2023 13:06:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 84.F5.42423.AC5F2946; Wed, 21
 Jun 2023 14:06:18 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230621130617eucas1p2525f138d93e3e4d0385cda670558b863~qrmlJMDn80596505965eucas1p2T;
 Wed, 21 Jun 2023 13:06:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230621130617eusmtrp157908a4e096267c8ad2bfbaa7ff6b47e~qrmlGGTkZ0857208572eusmtrp1W;
 Wed, 21 Jun 2023 13:06:17 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-82-6492f5ca367b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id F1.B8.14344.9C5F2946; Wed, 21
 Jun 2023 14:06:17 +0100 (BST)
Received: from CAMSVWEXC02.scsc.local (unknown [106.1.227.72]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230621130616eusmtip17e21dd5f7eca1289642f50e5db94443d~qrmkf0BdK0234302343eusmtip1d;
 Wed, 21 Jun 2023 13:06:16 +0000 (GMT)
Received: from localhost (106.210.248.248) by CAMSVWEXC02.scsc.local
 (2002:6a01:e348::6a01:e348) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 21 Jun 2023 14:06:15 +0100
Date: Wed, 21 Jun 2023 15:06:14 +0200
From: Joel Granados <j.granados@samsung.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 09/11] sysctl: Remove the end element in sysctl table
 arrays
Message-ID: <20230621130614.s36w4u7dzmb5d5p3@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="avrt2cz7yepdubk6"
Content-Disposition: inline
In-Reply-To: <87o7l92hg8.fsf@intel.com>
X-Originating-IP: [106.210.248.248]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC02.scsc.local (2002:6a01:e348::6a01:e348)
X-Brightmail-Tracker: H4sIAAAAAAAAA2VTaUwUZxjuNzM7s6LQAWz8RJomC0pEQDE2vrbV1IhkPEirtmliWnErU7Ry
 ZRfrVWXlZgFZFxRYkMtyCFsQXDegViwiLKKILg0IXiBoQbrcroBggaGtSf89x/u8eZ8v+cSk
 TbLYTrwvIJiXBUj9JLQFpa8ZbXC9NaL2WdEyxoKhOYeAKsVqaCwuQmAeTyPhyp9tFFSU6UTQ
 HxpBglZ3goChC5M0DFXX0vDyxiACg7aNgfTu2wy80rZMue0vRJB+N5yCieZYGrpUl0hoGumj
 4a0+nIGumg4G9PFT6xs1r0RQVVvJQGyPPaSpLhLQmdAhgrTkMAJy22JEkG8sQaAeVSF4+ocd
 pKYYEJjO2oNhOIIGfVMmgt+yCRg9ORfeGEppuB3rD31n0giIMedSkHQmFEF/tEkExsvpNDzW
 vhVB4/V6EURlXkbwvCqeAlV2GAmxzeU09Md10FBdcoeCh4l5FNTXGCgIyxwkYaygVgSxp5IZ
 0MacF0HB7ecEnMtfAgOVO6C3q4gCZUIU+lzKGZu2cOaIkxSnzdAiztRQh7gM7VFOo4inuTTF
 PYrLqt7K6c4/ILjY6h6Sy+lWUNzD3ArElTxQ01yF5hHD6a8v5sKvtTJffrzT4jMf3m/fT7xs
 +brdFnvTSiLJIIPkUI3xCqFApfZKJBZjdhXO716uRBZiG7YA4fGzF2iBDCN86peRWTKEcGr2
 U5ESzZlJlHbkiwQjH+F23TXi36mbr6+SArmEcEd9IpqOUOxi/Drh9EycZl3w3d6H5DSez7ri
 X1s6Z1aR7P01OKqseiZgy27H4TnRzDS2ZFfj3MFQJGBrXJfaSU1jkj2Ei9vvMNMtSHYRzp8U
 T8tzWCdc8WKCEk51wM3XztECPoZv6VpnLsXsg3lYWa6eNTxwgymMEbAt7qnVzWJ7XJ8YRwmB
 RIQrJ/sZgRQhnHdihBCmPsXhTZ2zifXYkHOTFt7VCrf8ZS0caoXV+mRSkC1xdKSNML0EFz3u
 pVTIQfNONc071TT/VRNkF5x1ZZD+n7wM52W/JAW8FhcX91FZiClEC/gDcn9fXu4ewB90k0v9
 5QcCfN32BPqXoan/Wj9ZO1iOzvYMuFUhQoyqkONUuONCUSOyowICA3jJfMsPy9Q+NpY+0sNH
 eFmgt+yAHy+vQovElGSB5bK1dXtsWF9pML+f54N42T8uIZ5jpyBAXH1DErmw9L3vfj4edQrd
 /GC4Z+X6paZ1STLXtpDG4qD9Lqet92UV5Li4G+/tNB9ehyNN9ZrljHY47qBiYNsmo0lS6JTd
 edU7yf3J0S/6r6asvFzT8lVS2ERnymnViZDa0v0ec2/YW/2uXKZesbHO85OEbQ6PMre7jq85
 kmsKmvco+ZjqzeZAmWVGuc+Tcrtw50Jns01GW4b0orq83eH75yEbGsy7u71U36Tqlu7IyG1+
 v2tjoKfr4LOvne28WluDtw5obLvafww2ji7UnPT2+7aP/KFQ6Whea+1x6Zl3i2QyrHJbzAar
 VYcnxhTPvNBxJ9/Nekfrvbs8N1n33tmye9caseP9jySUfK/U3ZmUyaV/A+eJIRoqBQAA
X-Brightmail-Tracker: H4sIAAAAAAAAA2WTfUxTZxTG9957e1s0aAcS7hB16eZgqIWilYMB5zI0Fzc30bklbgKd3KEb
 tKQFMnGaIjC1+AF1KgNC/CoIlEJZqzL8CkIpgwEq8m02oA75GBWhOMTCbm2WmeyfN7/3Oed5
 ct43OTzc7SrXi7dXmsjIpZI4ATmPaJytf7iqwaaOCRjt5YO+cYgEc8cFDPLLtSTUKIOgVVeK
 4NlMHg7Vj3sIyKiaI6Cq0sCBVNM5DtjVJi5MTvdwQTVrIODJoQwctIZUDAbsNSRMVMyyR209
 CSN3niIwa9m+ewMPSDg7lEpA/lATF6yFxxD0qge5MPdwEINL5j4MprSdGFTrxjCwVx3GYaJv
 kANzV7JxuHh+CofHFYcR5LekE2DvyCThZnolgps5ZSSMHZoh4FGWEYf7lgXQZrOSoPslA2Ot
 6Vwou/4Ch0emfi4c7Z8j4cpx9lXWtEhozZ3iQNrFchLar9JQU3+LCyMFJQgyh70hzWhDcEbv
 CXlZP2NgOdnPgbyzaRhoeo5yoK3wCQlF98sRqKez0IY6RN9v+5B+lnGCoH8ftRO0tkDLSu13
 cXrmuRrR3f02nB5rbkB0gXY/nas8TtJ5yrsEfa72I9rW1YzRz6f9aENxF0Zn1g7jW3fsFIbI
 ZUmJzJt7ZIrEUMEXIggUioJBGLgmWChaHbRrXaBY4L8+JIaJ25vMyP3XRwv3nO68jCWYBN91
 T5/nKFG5twq58Cj+GkrfX8RxsBtfg6gJa6hT96b0kw84TnanXrSrSBWax/aMI6qoqRZ3XoyI
 OlGS/7KL4C+n/j55+iWT/JVUy2gv7uBF/FVUWaeF4zDg/OZgKv2vNtJRcOdvo9IvHOE62JUf
 RGmeHkLO1D8QZb3QQjgLr1MNP1leMs5PpjJum1kDj+XFVNEszyG78H2oqkE74Rz1Larj5kXS
 yQeoCfufKAu5576SlPtKUu5/SU7Zj+qcHcL+J6+gCs+P4E4OpXQ6K3EOcUvQIiZJER8brwgU
 KiTxiiRprHC3LL4SsVtzxTRtuIaKh8eFNQjjoRr0NuvsryhtRV6EVCZlBItcl1SqY9xcYyT7
 Uhi5LEqeFMcoapCY/cZs3Mtjt4xdQWlilGhtgFi0Zm1wgDh47WqBp2t4whGJGz9Wksh8yzAJ
 jPxfH8Zz8VJiZ2NX1RkPLqyOXNKOKbsT7kUdOJwaOhM9aXEJ8857tkw8lSneeKbn1MSNhI/D
 l3oOPaxuCesMMPXuPO5htjARme8ZePuCLlvMn260Dezvur1yV6NldPhSdruvWr8dK530/PHX
 z0QnIlWGkXe//+COPmWpz5YNIz7vNH0dqqnWbt6eY/d/v2/plorxH5BdMb+A52lYn+aLfOoC
 Dm5+7vs4hZzu8NKE6D9ZybW+SNXcuEYujvLDVcc8Dp65Zp/8MqkgYr7RNNAcrZPOdhm/Kba8
 tqwvWpAT3lq+YPGKTEtYRFiZ56n8dePLF5Ra3riu3NbB2Vq/adOOhbyJ5N/EOU2f33pQvuWr
 KAGh2CMR+eFyheQfqa/esMoEAAA=
X-CMS-MailID: 20230621130617eucas1p2525f138d93e3e4d0385cda670558b863
X-Msg-Generator: CA
X-RootMTR: 20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3
References: <20230621091000.424843-1-j.granados@samsung.com>
 <CGME20230621094824eucas1p2b6adfbd3f15ff3665674917f419b25d3@eucas1p2.samsung.com>
 <20230621094817.433842-1-j.granados@samsung.com> <87o7l92hg8.fsf@intel.com>
X-Mailman-Approved-At: Thu, 22 Jun 2023 07:32:28 +0000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Ben Segall <bsegall@google.com>, linux-sctp@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, Wei Liu <wei.liu@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, bridge@lists.linux-foundation.org,
 James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Eric Biggers <ebiggers@kernel.org>,
 linux-cachefs@redhat.com, Mel Gorman <mgorman@suse.de>, "Darrick J.
 Wong" <djwong@kernel.org>, Waiman Long <longman@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Petr Mladek <pmladek@suse.com>, Martin Schiller <ms@dev.tdt.de>,
 Russ Weight <russell.h.weight@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Remi Denis-Courmont <courmisch@gmail.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Will Drewry <wad@chromium.org>, Neil Horman <nhorman@tuxdriver.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, mcgrof@kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, netfilter-devel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 linux-fsdevel@vger.kernel.org, Matthieu Baerts <matthieu.baerts@tessares.net>,
 Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.org,
 linux-wpan@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 linux-aio@kvack.org, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, linux-ia64@vger.kernel.org,
 Naoya Horiguchi <naoya.horiguchi@nec.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Clemens Ladisch <clemens@ladisch.de>, Phillip Potter <phil@philpotter.co.uk>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>,
 keyrings@vger.kernel.org, John Stultz <jstultz@google.com>,
 Stanislav Fomichev <sdf@google.com>, Jan Karcher <jaka@linux.ibm.com>,
 codalist@telemann.coda.cs.cmu.edu, linux-s390@vger.kernel.org,
 Valentin Schneider <vschneid@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>,
 Leon Romanovsky <leon@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Will Deacon <will@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Mat Martineau <martineau@kernel.org>, Matthew Bobrowski <repnop@google.com>,
 Julian Anastasov <ja@ssi.bg>, coreteam@netfilter.org,
 Roopa Prabhu <roopa@nvidia.com>, Yonghong Song <yhs@fb.com>,
 Iurii Zaikin <yzaikin@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Mike Travis <mike.travis@hpe.com>,
 Wenjia Zhang <wenjia@linux.ibm.com>, Simon Horman <horms@verge.net.au>,
 Xin Long <lucien.xin@gmail.com>, linux-arm-kernel@lists.infradead.org,
 fsverity@lists.linux.dev, Hao Luo <haoluo@google.com>,
 Theodore Ts'o <tytso@mit.edu>, Stephen Boyd <sboyd@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, Florian Westphal <fw@strlen.de>,
 Robin Holt <robinmholt@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jon Maloy <jmaloy@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 linux-hams@vger.kernel.org, Nikolay Aleksandrov <razor@blackwall.org>,
 Alexei Starovoitov <ast@kernel.org>, Marc Dionne <marc.dionne@auristor.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-afs@lists.infradead.org,
 Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, lvs-devel@vger.kernel.org,
 coda@cs.cmu.edu, Doug Gilbert <dgilbert@interlog.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Paolo Abeni <pabeni@redhat.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.com>,
 intel-gfx@lists.freedesktop.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-crypto@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 openipmi-developer@lists.sourceforge.net, mptcp@lists.linux.dev,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-mm@kvack.org,
 Jeff Layton <jlayton@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
 linux-xfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, Ying Xue <ying.xue@windriver.com>, bpf@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Steve Wahl <steve.wahl@hpe.com>, Peter Zijlstra <peterz@infradead.org>,
 Balbir Singh <bsingharora@gmail.com>, Amir Goldstein <amir73il@gmail.com>,
 KP Singh <kpsingh@kernel.org>, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Steffen Klassert <steffen.klassert@secunet.com>,
 rds-devel@oss.oracle.com, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org,
 Mark Fasheh <mark@fasheh.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Joerg Reuter <jreuter@yaina.de>,
 linux-hyperv@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, apparmor@lists.ubuntu.com,
 linux-raid@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Juergen Gross <jgross@suse.com>, John Johansen <john.johansen@canonical.com>,
 linux-x25@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 David Ahern <dsahern@kernel.org>, kexec@lists.infradead.org,
 linux-security-module@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 tipc-discussion@lists.sourceforge.net, Martin KaFai Lau <martin.lau@linux.dev>,
 Karsten Graul <kgraul@linux.ibm.com>, Joel Becker <jlbec@evilplan.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--avrt2cz7yepdubk6
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 02:16:55PM +0300, Jani Nikula wrote:
> On Wed, 21 Jun 2023, Joel Granados <j.granados@samsung.com> wrote:
> > Remove the empty end element from all the arrays that are passed to the
> > register sysctl calls. In some files this means reducing the explicit
> > array size by one. Also make sure that we are using the size in
> > ctl_table_header instead of evaluating the .procname element.
>=20
> Where's the harm in removing the end elements driver by driver? This is
> an unwieldy patch to handle.

I totally agree. Its a big one!!! but I'm concerned of breaking bisectibili=
ty:
* I could for example separate all the removes into separate commits and
  then have a final commit that removes the check for the empty element.
  But this will leave the tree in a state where the for loop will have
  undefined behavior when it looks for the empty end element. It might
  or might not work (probably not :) until the final commit where I fix
  that.

* I could also change the logic that looks for the final element,
  commit that first and then remove the empty element one commit per
  driver after that. But then for all the arrays that still have an
  empty element, there would again be undefined behavior as it would
  think that the last element is valid (when it is really the sentinel).

Any ideas on how to get around these?
>=20
> > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i9=
15_perf.c
> > index f43950219ffc..e4d7372afb10 100644
> > --- a/drivers/gpu/drm/i915/i915_perf.c
> > +++ b/drivers/gpu/drm/i915/i915_perf.c
> > @@ -4884,24 +4884,23 @@ int i915_perf_remove_config_ioctl(struct drm_de=
vice *dev, void *data,
> > =20
> >  static struct ctl_table oa_table[] =3D {
> >  	{
> > -	 .procname =3D "perf_stream_paranoid",
> > -	 .data =3D &i915_perf_stream_paranoid,
> > -	 .maxlen =3D sizeof(i915_perf_stream_paranoid),
> > -	 .mode =3D 0644,
> > -	 .proc_handler =3D proc_dointvec_minmax,
> > -	 .extra1 =3D SYSCTL_ZERO,
> > -	 .extra2 =3D SYSCTL_ONE,
> > -	 },
> > +		.procname =3D "perf_stream_paranoid",
> > +		.data =3D &i915_perf_stream_paranoid,
> > +		.maxlen =3D sizeof(i915_perf_stream_paranoid),
> > +		.mode =3D 0644,
> > +		.proc_handler =3D proc_dointvec_minmax,
> > +		.extra1 =3D SYSCTL_ZERO,
> > +		.extra2 =3D SYSCTL_ONE,
> > +	},
> >  	{
> > -	 .procname =3D "oa_max_sample_rate",
> > -	 .data =3D &i915_oa_max_sample_rate,
> > -	 .maxlen =3D sizeof(i915_oa_max_sample_rate),
> > -	 .mode =3D 0644,
> > -	 .proc_handler =3D proc_dointvec_minmax,
> > -	 .extra1 =3D SYSCTL_ZERO,
> > -	 .extra2 =3D &oa_sample_rate_hard_limit,
> > -	 },
> > -	{}
> > +		.procname =3D "oa_max_sample_rate",
> > +		.data =3D &i915_oa_max_sample_rate,
> > +		.maxlen =3D sizeof(i915_oa_max_sample_rate),
> > +		.mode =3D 0644,
> > +		.proc_handler =3D proc_dointvec_minmax,
> > +		.extra1 =3D SYSCTL_ZERO,
> > +		.extra2 =3D &oa_sample_rate_hard_limit,
> > +	}
> >  };
>=20
> The existing indentation is off, but fixing it doesn't really belong in
> this patch.

Agreed. But I actually was trying to fix something that checkpatch
flagged. I'll change these back (which will cause this patch to be
flagged).

An alternative solution would be to fix the indentation as part of the
preparation patches. Tell me what you think.

Thx

>=20
> BR,
> Jani.
>=20
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center

--=20

Joel Granados

--avrt2cz7yepdubk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmSS9cQACgkQupfNUreW
QU/tWQv+LHqhRfLnActmTK06NicBnR3PUYRIMank4jSVG6jtvqu/VBMNmvKyRaeA
68kGzzIEbayPbBOL1M2GmrBgIaWp9OIWt4jKQeY4ARm9DcL2FWqUqLufGoPlwjX/
0GFjsIlBykddf6c3149Hf7D2Xz+hZyF8GgqMaIuty4hcNbIoeYs5zmwPaQmn+/q0
eoe07uBOs32ocQPIMJuRPMw6KSxHYOiWbNHxgQlIl7stObKOuvQXO2GLDgqHc13y
NKMTC6XNh4VAc7JHtrsEVEBiVro3IGh7cS5U5DK0jhlSLsRfJUkXmSO4H9EwGLBq
mWAl5Qr+YGnCrfE6jGc7uTM0etzscRGIlKIJ+7qcLgSfVgkqYeb5AmkZ8bvailD8
h66rr3XzwBKiQRaXpk6V7/IliqJcG7+N2yGsGJ3UXpvoF/1ieeb39kcSOFZ75BU5
USV/t5Fj0VqHetwv6dC5A8RLktlHNQZcTAXJkLL0QZ5xrmWC9kiIJ/EzJnCgJlSu
AwkfgT+P
=LLXc
-----END PGP SIGNATURE-----

--avrt2cz7yepdubk6--
