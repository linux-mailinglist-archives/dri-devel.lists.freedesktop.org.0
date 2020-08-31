Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D225786B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 13:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338456E10F;
	Mon, 31 Aug 2020 11:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCCF6E11B
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 11:29:33 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VBOxjs048058;
 Mon, 31 Aug 2020 11:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=83mx2gs2pYrFfFa5r14IiZzaFJZ6nsCu2y13lBTB76Q=;
 b=NDTBzYuTJ8xrA9j2IaS74rR1fbTaT1CKpLw3kB41nmkmk1Mr6yU4Yr57jo828ld7HM3g
 RCDREu3Z+LCSz9IT492IEEzj6vq4lRF8pTSsFi6mgRia9HUqD2zmLVcIEYlTSX1YBnzC
 LTQVwyPEGE6lQhr8gOlWnWEhEyTOuNtZ5NscyeR9kmUSen0DhoVNMos0mNi4HFKXRWC3
 wG8odS7QJi7q3nywtyVkqMnEFWdB0xmGrbxvlOTE/QUbWlBSW+y9aFgCc12bldNJmYhM
 OocXQEtN1rPYo3gUDMnKAERwTRuZpBMx1FG5ZnvaMLOD11L6P7PNlXC5IrPU41/9cL/k pw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 337eeqnrn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 31 Aug 2020 11:29:31 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VBQXjZ008483;
 Mon, 31 Aug 2020 11:29:30 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 3380x00v4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Aug 2020 11:29:30 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07VBTT0o030765;
 Mon, 31 Aug 2020 11:29:29 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 31 Aug 2020 04:29:29 -0700
Date: Mon, 31 Aug 2020 14:29:24 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: agx@sigxcpu.org
Subject: [bug report] drm/panel: Add panel driver for the Mantix
 MLAF057WE51-X DSI panel
Message-ID: <20200831112924.GA512743@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=3 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310065
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=3
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310065
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Guido G=FCnther,

The patch 72967d5616d3: "drm/panel: Add panel driver for the Mantix
MLAF057WE51-X DSI panel" from Aug 17, 2020, leads to the following
static checker warning:

	drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c:205 mantix_get_modes()
	error: we previously assumed 'mode' could be null (see line 204)

drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
   197  static int mantix_get_modes(struct drm_panel *panel,
   198                              struct drm_connector *connector)
   199  {
   200          struct mantix *ctx =3D panel_to_mantix(panel);
   201          struct drm_display_mode *mode;
   202  =

   203          mode =3D drm_mode_duplicate(connector->dev, &default_mode);
   204          if (!mode) {
   205                  dev_err(ctx->dev, "Failed to add mode %ux%u@%u\n",
   206                          default_mode.hdisplay, default_mode.vdispla=
y,
   207                          drm_mode_vrefresh(mode));
                                                  ^^^^
This will lead to a NULL dereference.

   208                  return -ENOMEM;
   209          }
   210  =

   211          drm_mode_set_name(mode);
   212  =

   213          mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERR=
ED;
   214          connector->display_info.width_mm =3D mode->width_mm;
   215          connector->display_info.height_mm =3D mode->height_mm;
   216          drm_mode_probed_add(connector, mode);
   217  =

   218          return 1;
   219  }

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
