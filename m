Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7FC6C6A90
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 15:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4527888647;
	Thu, 23 Mar 2023 14:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E7988647
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 14:17:56 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ND6Paq002292; Thu, 23 Mar 2023 14:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cpFYQ2RGL4S22c+iykKlnzU6tO8T2kyReL46W2u6N/A=;
 b=MG5ejEv/qpozMv8iB3QyhdwwSiWQvFW9dy1T2RxAOOkyQ3Hrn5WD8MBjambXIEIQkPZ/
 dp4UxmZO9PnuvwRMp82oJT7zbIAf/3m4awsoGylzqZQIfkYlEr1Nn2E0HOTiD9Sy2AjT
 qy99Ulzy4Gp6wVim+Z5aJ+LMzi3OURoKhNUEY/F5MMNUY7LevPvzM4P3OWRgSruidXm1
 eje776vQKUHJynhTZDB9KM1G8EOY7W5Z3XnOXZmFnph5TwD1N8oVglbIvlp79Ra8b5pn
 67DnL/vGBNk+3eNs5JGur/P5S7Hvd3CehNQlaV5yPWaOyVTNGLLKA5DjV/9boRjKwkHu Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgk22gfr7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 14:17:45 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ND8rkr014433;
 Thu, 23 Mar 2023 14:17:45 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pgk22gfq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 14:17:44 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NDlMOi014687;
 Thu, 23 Mar 2023 14:17:42 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pd4x6e8yv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Mar 2023 14:17:42 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 32NEHde142271144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Mar 2023 14:17:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DB362004B;
 Thu, 23 Mar 2023 14:17:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7400920043;
 Thu, 23 Mar 2023 14:17:38 +0000 (GMT)
Received: from [9.171.87.16] (unknown [9.171.87.16])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Mar 2023 14:17:38 +0000 (GMT)
Message-ID: <917b95c9af1b80843b8a361d1b7fa337a25105e7.camel@linux.ibm.com>
Subject: Re: [PATCH v3 35/38] video: handle HAS_IOPORT dependencies
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Mar 2023 15:17:38 +0100
In-Reply-To: <ZBGbxDWEhqr8hhgU@intel.com>
References: <20230314121216.413434-1-schnelle@linux.ibm.com>
 <20230314121216.413434-36-schnelle@linux.ibm.com>
 <CAMuHMdW4f8GJ-kFDPg6Ao=g3ZAXq79u9nUZ_dW1LonHu+vxk8Q@mail.gmail.com>
 <ZBGbxDWEhqr8hhgU@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wOByOOqF28Bb_tV_j8EvP2d7aSoJMXnM
X-Proofpoint-GUID: kXBBpD7D6_8p_SykMMv8dWepn1gybyIZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_21,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0
 mlxlogscore=513 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230106
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 linux-fbdev@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alan Stern <stern@rowland.harvard.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-03-15 at 12:19 +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Wed, Mar 15, 2023 at 09:16:50AM +0100, Geert Uytterhoeven wrote:
> > Hi Niklas,
> >=20
> > On Tue, Mar 14, 2023 at 1:13=E2=80=AFPM Niklas Schnelle <schnelle@linux=
.ibm.com> wrote:
> > > In a future patch HAS_IOPORT=3Dn will result in inb()/outb() and frie=
nds
> > > not being declared. We thus need to add HAS_IOPORT as dependency for
> > > those drivers using them and guard inline code in headers.
> > >=20
> > > Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> > > Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> >=20
> > Thanks for your patch!
> >=20
> > > --- a/drivers/video/fbdev/Kconfig
> > > +++ b/drivers/video/fbdev/Kconfig
> >=20
> > > @@ -1284,7 +1285,7 @@ config FB_ATY128_BACKLIGHT
> > >=20
> > >  config FB_ATY
> > >         tristate "ATI Mach64 display support" if PCI || ATARI
> > > -       depends on FB && !SPARC32
> > > +       depends on FB && HAS_IOPORT && !SPARC32
> >=20
> > On Atari, this works without ATARI_ROM_ISA, hence it must not depend
> > on HAS_IOPORT.
> > The only call to inb() is inside a section protected by #ifdef
> > CONFIG_PCI. So:
>=20
> That piece of code is a nop anyway. We immediately overwrite
> clk_wr_offset with a hardcoded selection after the register reads.
> So if you nuke that nop code then no IOPORT dependency required
> at all.
>=20

I agree this "looks" like a nop but are we sure the inb() doesn't have
side effects?=C2=A0
(for reference drivers/video/fbdev/aty/aty/atyfb_base.c:
atyfb_setup_generc() towards the end)

It does feel a bit out of scope for this series but if it's really a
nop nuking it surely is the cleaner solution.

Thanks,
Niklas

