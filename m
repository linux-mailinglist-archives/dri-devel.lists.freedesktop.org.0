Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC67A2C9960
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BFF6E573;
	Tue,  1 Dec 2020 08:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180826E4AF;
 Tue,  1 Dec 2020 05:53:11 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B15n67q107471;
 Tue, 1 Dec 2020 05:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=l9ihS9O8ty7fvCGsyg6t+FL2UWzq+Pp7wI7g9M3fu94=;
 b=emDPbOhPomsDJ0NVhkgalKaWcDmTVt43uxmasZhRdsIKDAK5SyUn3ZBbDT0tfjc2Ub+G
 pwnVB+2L6jYArSQUwoKsFjxw+gIeAIQd1agInCI9m5zu6sstYek99cFlGrF83pfAMoYp
 7h3VW08t/kH06cHx+UsVCvNai9zlonapT50haza8ExqU3V0ifCJ/7nW0lmA/qRSavM+P
 eE0d7ezZdfPLepa71ISDd/u3VXj3GbiZhoaxq0dsKdiEuu46H687kMfk2k9ooRtVL0+n
 yN1cC747fo++ObKGg9Es3E0DMkXRjQCXCIESHdIfuri0sdDNQNO6hiI2IHC3bOw+gche Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 353c2aru96-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 05:53:05 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B15oGDF104852;
 Tue, 1 Dec 2020 05:53:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3540arqfy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 01 Dec 2020 05:53:04 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B15r2KY111063;
 Tue, 1 Dec 2020 05:53:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 3540arqfwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Dec 2020 05:53:02 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B15qbsa005213;
 Tue, 1 Dec 2020 05:52:40 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 30 Nov 2020 21:52:37 -0800
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1h7p6gjkk.fsf@ca-mkp.ca.oracle.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
Date: Tue, 01 Dec 2020 00:52:27 -0500
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org> (Gustavo
 A. R. Silva's message of "Fri, 20 Nov 2020 12:21:39 -0600")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9821
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=289 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010039
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, target-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, tipc-discussion@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, drbd-dev@tron.linbit.com,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 x86@kernel.org, linux-nfs@vger.kernel.org, GR-Linux-NIC-Dev@marvell.com,
 Kees Cook <keescook@chromium.org>, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Gustavo,

> This series aims to fix almost all remaining fall-through warnings in
> order to enable -Wimplicit-fallthrough for Clang.

Applied 20-22,54,120-124 to 5.11/scsi-staging, thanks.

-- 
Martin K. Petersen	Oracle Linux Engineering
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
