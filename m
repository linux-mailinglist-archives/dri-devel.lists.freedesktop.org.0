Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C02775AF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 17:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5216EB2B;
	Thu, 24 Sep 2020 15:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5EA26EB2B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 15:45:45 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFZ23Y158292;
 Thu, 24 Sep 2020 15:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=ptE4rBnIcvQs1r3P1XI5UZCVxhNT0iC7WiQxJa50zew=;
 b=azWkeHZmC4B21Ls1F5NpziOnh0GPmAKktox4SDp1B2wsB7xTxHCviZWLxEjyeI1lRkKr
 jdBRozHvrcFs7JkdOCZhPY3XsR6aMBb5BL2A9MjMUrpSNWV1kdhuqM25exJHTnXqSEr9
 r0OYAa5cM14a5xYZa5Bo+purM3NnfEg5dHQ+AtYJ6XRahrIf8QjRobUe4ZgXykUDUlXd
 e7BGihSe81vycIPnTfpsKWrNLUdVDeNBTjdxs5O8kF4ETbea7jyc9XehgcJ/jJ9M+4z7
 q/TA6PY2o0xI9aDw/WLPKAXoDy9nwA2puGkFCBkZvcbhYB4zZj+7BWmwPk3dSJYRigSj Xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 33ndnus4k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 15:45:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OFUAKT131611;
 Thu, 24 Sep 2020 15:45:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 33r28x5gas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 15:45:33 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08OFjOVg029780;
 Thu, 24 Sep 2020 15:45:24 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 08:45:23 -0700
Date: Thu, 24 Sep 2020 18:45:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200924154516.GL4282@kadam>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <20200924140937.GA749208@kroah.com>
 <394733ab6fae47488d078cb22f22a85b@AcuMS.aculab.com>
 <20200924153035.GA879703@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924153035.GA879703@PWN>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240118
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240118
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Laight <David.Laight@ACULAB.COM>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch has a tool to show where struct members are set.

`~/smatch/smatch_data/db/smdb.py where console_font height`

It's not perfect and this output comes from allmodconfig on yesterday's
linux-next.

regards,
dan carpenter

drivers/video/console/vgacon.c | vgacon_init                    | (struct console_font)->height | 0-32
drivers/video/console/vgacon.c | vgacon_adjust_height           | (struct console_font)->height | 1-32
drivers/video/fbdev/core/fbcon.c | fbcon_startup                  | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
drivers/video/fbdev/core/fbcon.c | fbcon_init                     | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
drivers/video/fbdev/core/fbcon.c | fbcon_do_set_font              | (struct console_font)->height | 0-u32max
drivers/video/fbdev/core/fbcon.c | fbcon_set_def_font             | (struct console_font)->height | 6,8,10-11,14,16,18,22,32
drivers/usb/misc/sisusbvga/sisusb_con.c | sisusbcon_init                 | (struct console_font)->height | 0-u32max
drivers/usb/misc/sisusbvga/sisusb_con.c | sisusbcon_do_font_op           | (struct console_font)->height | 1-32
drivers/tty/vt/vt_ioctl.c      | vt_k_ioctl                     | (struct console_font)->height | ignore
drivers/tty/vt/vt_ioctl.c      | vt_resizex                     | (struct console_font)->height | 0-u32max
drivers/tty/vt/vt_ioctl.c      | vt_ioctl                       | (struct console_font)->height | ignore
drivers/tty/vt/vt_ioctl.c      | vt_compat_ioctl                | (struct console_font)->height | ignore
drivers/tty/vt/vt.c            | vc_allocate                    | (struct console_font)->height | 0
drivers/tty/vt/vt.c            | vt_resize                      | (struct console_font)->height | ignore
drivers/tty/vt/vt.c            | do_con_write                   | (struct console_font)->height | ignore
drivers/tty/vt/vt.c            | con_unthrottle                 | (struct console_font)->height | ignore
drivers/tty/vt/vt.c            | con_flush_chars                | (struct console_font)->height | ignore
drivers/tty/vt/vt.c            | con_shutdown                   | (struct console_font)->height | ignore
drivers/tty/vt/vt.c            | con_cleanup                    | (struct console_font)->height | ignore
drivers/tty/vt/vt.c            | con_init                       | (struct console_font)->height | 0
drivers/tty/vt/vt.c            | con_font_set                   | (struct console_font)->height | 1-32
drivers/tty/vt/vt.c            | con_font_default               | (struct console_font)->height | 0-u32max
drivers/tty/vt/selection.c     | paste_selection                | (struct console_font)->height | ignore

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
