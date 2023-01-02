Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156D65BC28
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 09:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518A810E3A7;
	Tue,  3 Jan 2023 08:25:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8558710E350
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 15:17:45 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 302Bx46E011991; Mon, 2 Jan 2023 13:41:52 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3mtd0uv746-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Jan 2023 13:41:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxO5o76k7CjUEU6rKKrq5RwfzDgbpnnwrNT6z5k537oR14SrE8C61Oycz18oAseHvZ5mfJVPJWAiqGbzvAf6WtNKcqLto4f8HZ9QWw0Aa1Xyay7WuO5n2azLMPYE5n+up7JuVXh61z1ntQL7NpDN1dRN8uX8z99LefuygMdoyhVSSkrOuEFl8PPx58VfIdoQD/PgyTze/YMO4G1TqX9pumEtbErIdRFjYc9tln8xP92nSfCi7ygEVvm44G/zF30Go8W5eS1hLo8dNblHsLBCd3ihFUxweQyzGpTB2r75WciMOaoqm2oe0ET/vo7c5bJ2Rdr3fCIhTrx+IBjaHdtmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIV9qnXRfvVgBfrc0HVcsMdFAbZxe0DZ7oyvFfhKedY=;
 b=OyKgCuMQiWAlZ80MzuCxTb5BV5m7N6DxFVfVmJcnrVuzV7yPFAR2DNZg98UNuLIu6II7/bqX78wXnGwAdkqwI3sLPDi8wyrrhLfcpXhKIBjIvZnvlAyqw1E70WsOPMyjP8qFB15hIf/AvEi3SSydbz0Q0qJ08rtBu26mMHaJ42lrFPyuCmJMOlmoc73cDiD7KEoyWm/ZkNXpS0bctlQpUFIqkFsA+dcKbUTeruuz2M3quMg5wH0UHkm422fc9mcSMl7eRRiiXj6j6wpj73+tgciZDtakctFbVGXLkpsGuJcdIlTm6jH5w/LKE/F55yfuY4axoZIQurkYogZ8YG8PTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIV9qnXRfvVgBfrc0HVcsMdFAbZxe0DZ7oyvFfhKedY=;
 b=lm6SXYlSebGIE4OJ9EN9GySexcKaGRBtdfEQ/x13J2lS+m1haBrn9HM+JRVBdHcFmMi9NgfCnCYkwS4oRsmfjgM/Pp/BhL9+bl9/+2xRhKX8NbkBQ2JpNT8rEK52Dh9zCo1scOxpA5kSjNzXzOdZbhQmADgvRTNTYZ+c9g9JIwT5De9jwft0GVJmeX+ond7HcQVe++B1jVYDyUQOm3PwBEl8I0rfXIatq82OzrqiGt+1MEV41xJ8vDc/6Yuc7rWpHCYI7z5k2uGGTWFYpbyazqDQCyefpdTl4NBcT1QpxfL44hZyX/0Gzl1wYVxwh4tiIloMJ/CyhIMDW0pDD9Xccg==
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by DB9PR03MB9709.eurprd03.prod.outlook.com (2603:10a6:10:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 13:41:49 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2da6:6d63:389b:3552]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::2da6:6d63:389b:3552%9]) with mapi id 15.20.5944.019; Mon, 2 Jan 2023
 13:41:49 +0000
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: "jgross@suse.com" <jgross@suse.com>
Subject: [PATCH v1 2/3] dma-buf: add dma buffer release notifier callback
Thread-Topic: [PATCH v1 2/3] dma-buf: add dma buffer release notifier callback
Thread-Index: AQHZHq/2iAqVu94bUUyzCrbXi66OTA==
Date: Mon, 2 Jan 2023 13:41:48 +0000
Message-ID: <835ecf35d2d2d1ea763fe25837f52297c83c511f.1672666311.git.oleksii_moisieiev@epam.com>
References: <cover.1672666311.git.oleksii_moisieiev@epam.com>
In-Reply-To: <cover.1672666311.git.oleksii_moisieiev@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|DB9PR03MB9709:EE_
x-ms-office365-filtering-correlation-id: 6a772b46-7aa1-4f3f-dd01-08daecc71919
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6xZItbt6oR7HVPauOPDvu99ZgGdQHMCdkGOIK7Kf9Q67OhE2zJOil5CfaljTx7dGNpXpOL7iVBxiNA6cDipi83qifFGwuURzg0ogrKgNTtcaPFHeFUrFc308gr41XBMdaR6o5qI3hFXm0QxX6MMOsXkeg3gdozFIGVtyQ21cL9HCBlItZUcTbzFk5xzmK4xTrpy3evhOWQ6u/pjRS9jRApRLS3wPXK5VWRQuFeoRYB66LUvwCwsoWPwttdan2jw7GFgsJSwe5C2FLyPsXJVEChGO8Fby4TJFfND2Hos1MYb49wG8v5SRWwlm7Ye1qaW8HyvmG6o1+WdZrNm+u8K/X/wDWoLtrlCgQZTYO3dJ7w9HNUMHSfSQA76KMjqiKzjwVa75kDB0339uWOrRQH9uqhKdkm17k3p0lElizw/IeD6j8ZcJ6TtW9Ip1Bqki0aE1DgMHnf/K/xvdAVIwCnrhbeSubHqL1I+n/CtdxYAW6zIo4k4vSeGkqubyzuqKMVlxPBGTVYIv3PCDwDmXnNvPCEs4vgXXG2dEevKtpgdq9Hx8jBAUR1u1hN1wkW3HeUGnL47AhPZVSjbh2Z82WJ0vIydhVjQQo0HDzzbKCG9wuNr6TLWNkY/fSlr33cstWE2qjLGIfR/fPP6+PIyH35CP/ZHcLlHkol+qxAnqJzRHO0R5QUiu0hwzWP5zpsw3FZq6FBDj/GLll8rrIWm8aHqp2jRryQgsZ8t4zXmPuWzv9o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR03MB7136.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(38100700002)(122000001)(86362001)(8676002)(38070700005)(66476007)(76116006)(66946007)(64756008)(66446008)(66556008)(6916009)(91956017)(4326008)(41300700001)(54906003)(316002)(2906002)(5660300002)(8936002)(2616005)(83380400001)(6512007)(478600001)(71200400001)(6486002)(6506007)(26005)(55236004)(186003)(36756003)(22166006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZSgpoXOX/ZZA1Vgo0MZN1aN//8+zLiN43kF69YgxoeR8frlg8vwJu7x+fX?=
 =?iso-8859-1?Q?xSVVGWVO+q9rOqDQ9N4W9nEqQNi2I9DBQGEKkGFY8lAvbuko1m+1Gx5nOz?=
 =?iso-8859-1?Q?3crIq0sE206KoIUQn0Gcbiw227Jw/43zylM2WeSxpdk6zwcRcJnD0STJav?=
 =?iso-8859-1?Q?d/srqcdvx+np25XIsevDxDjp870UXFPTrf3IRdhamWSbZwn9pgYQ0oT+1M?=
 =?iso-8859-1?Q?LET6oOcFfHtashYQ5Ng8LTGXAvTg/w/wIg7iYFJ1valtosgTq75RFPu+92?=
 =?iso-8859-1?Q?IIszRPLSm4D91jgr7DjKgKv/9HG6Lg9ybkjaHxqhb3gLBMpdkw0dd0XqHT?=
 =?iso-8859-1?Q?NTQKTXDjW3FlDAtpd5+4XcJZN5wduuVwzxyoGekNeWG2OO9/l4kZGi98JD?=
 =?iso-8859-1?Q?vhr3wvyfwqQzsRM9uZaMd/uxb6J5zNpUoL1xB+ZhaoZ3k1NElO7VKihYXy?=
 =?iso-8859-1?Q?fWDVlte/YoQvR8qFxGBDpemv1eDSLI4Re20GqnMbZdxSlLWmi74SuUnRKe?=
 =?iso-8859-1?Q?v5xBmPRUYMWPoCuV90hoUTsUI8mcxYsbkXd4DD9slIZCXeeSqHCjl15nZV?=
 =?iso-8859-1?Q?GB3bo4PcmzpxcilJ+XCBDaxaRXge5YFVfEPqaYRq1bjDAZn+r6cJNuORoe?=
 =?iso-8859-1?Q?bjHEWBPyYuKKjqtiuGQIggyAJFzcImJgGATOGwTGAk8WE1z2CACo1yzYm0?=
 =?iso-8859-1?Q?TyC9xvxMFRFUApNvf8KzQEb9h++X1yaF2QgM+KNdzTq2UtW0WeiuOx8b9g?=
 =?iso-8859-1?Q?iW26H4jd29TMsxLttDkCPzvAkLfth484McHNtMx/+KDocsuFCzGMM6osmW?=
 =?iso-8859-1?Q?rUnNVTgAww+E+CLXCezs+SXKFtpGPib4fV9kOIQBVN0QKmspbCo3+wiy1p?=
 =?iso-8859-1?Q?CuYE/FmvVd65LYXWy46+nHpljHzWQ1cc6T09tMUM1+OT0W/dyuvbUkveRR?=
 =?iso-8859-1?Q?SsFMhvX1Od9GbwHyYkoH7f53dOQNk9xlNsa9rXM8OxCRsuB/fAGnJUcvky?=
 =?iso-8859-1?Q?sU2DkExSpeJ8pYZl1lJtpZT2Qd4jdHxy2aSgjxME/UEMH9krvlW10q7a0q?=
 =?iso-8859-1?Q?5x+y3o0nZQUysNTjISbrddrugIr8UWRiPI+ftxgTG/zc5g3ch69oq43157?=
 =?iso-8859-1?Q?kvQGca/mbT46Lc1zuM8vLC/B5HwRv0Hwx6l6a707EGl6chP7GbF0wHULp/?=
 =?iso-8859-1?Q?wbwK+THDjqzspYRZWtguxMKTZGLCvj7uP0vJ2rJQl6Oq1quyMsT4Baf0ik?=
 =?iso-8859-1?Q?PtZkubNMOn7EXCY8t+v3DzH/Y3bBoBOQsQQwpsx3Wt/hxUx2u9oj2aOoSn?=
 =?iso-8859-1?Q?nUoVeI+uEXZ6ifqg73aVy7Fs4lkz1VtJ2h3TqukUoS3zJnOGGcKX2Q/FYE?=
 =?iso-8859-1?Q?Ry0RQA83pZWnjqGrODWrhSPtD15MVFqEmiaFC0pQnWQ0710f5gxDNITEQk?=
 =?iso-8859-1?Q?GK71JA9yeagTmfH2B47Anu1Pigjzi0q9+Nxc+thr52VW2ZuFlFNDUNT4DW?=
 =?iso-8859-1?Q?70JOX5LB9vjGFeuefKeoxBKBMe8okVWvG/S58DURQwul6XywvvH7nIPbEe?=
 =?iso-8859-1?Q?d3ynZ5XCGF/MuTDMJxaE4OSoFgQ9CxfJhEe3jHmzo8JGW/y+L/EGeEj77W?=
 =?iso-8859-1?Q?DzrgnbHaz9y2LKMm61n4Q3bHmF5Pe19SL0jC32gwVMOlRULlCDYWk3vA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a772b46-7aa1-4f3f-dd01-08daecc71919
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2023 13:41:48.9962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQbH5ZtPMRkf5Lq6Jdo1NpaaN0V7CSgdcxJfYDDOXQM4wc1apBGOrkf7D/qZ/5DSjk5C2bFAufoxpe7okefYoO8K7PdqQLH7QRo332Az9W8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB9709
X-Proofpoint-GUID: OvaobUQFU99AdHxtz2tas7SLtdW6NrxG
X-Proofpoint-ORIG-GUID: OvaobUQFU99AdHxtz2tas7SLtdW6NrxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_08,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020124
X-Mailman-Approved-At: Tue, 03 Jan 2023 08:24:55 +0000
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add posibility to register callback on dma-buffer which is
called before dma_buf->ops->release call.
This helps when external user of the dma buffer should be notified
before buffer releases without changing dma-buf ops. This is needed when
external dma buffer is used as backing storage for gntdev refs export
and grant refs should be unmapped before dma buffer release.

Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
---
 drivers/dma-buf/dma-buf.c | 44 +++++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h   | 15 +++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index efb4990b29e1..3e663ef92e1f 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -25,6 +25,7 @@
 #include <linux/dma-resv.h>
 #include <linux/mm.h>
 #include <linux/mount.h>
+#include <linux/notifier.h>
 #include <linux/pseudo_fs.h>
=20
 #include <uapi/linux/dma-buf.h>
@@ -57,6 +58,46 @@ static char *dmabuffs_dname(struct dentry *dentry, char =
*buffer, int buflen)
 			     dentry->d_name.name, ret > 0 ? name : "");
 }
=20
+int dma_buf_register_release_notifier(struct dma_buf *dmabuf,
+			ext_release_notifier_cb ext_release_cb, void *priv)
+{
+	int ret =3D 0;
+
+	spin_lock(&dmabuf->ext_release_lock);
+
+	if (dmabuf->ext_release_cb) {
+		ret =3D -EEXIST;
+		goto unlock;
+	}
+
+	dmabuf->ext_release_cb =3D ext_release_cb;
+	dmabuf->ext_release_priv =3D priv;
+ unlock:
+	spin_unlock(&dmabuf->ext_release_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dma_buf_register_release_notifier);
+
+void dma_buf_unregister_release_notifier(struct dma_buf *dmabuf)
+{
+	spin_lock(&dmabuf->ext_release_lock);
+	dmabuf->ext_release_cb =3D NULL;
+	spin_unlock(&dmabuf->ext_release_lock);
+}
+EXPORT_SYMBOL_GPL(dma_buf_unregister_release_notifier);
+
+static void dma_buf_call_release_notifier(struct dma_buf *dmabuf)
+{
+	if (!dmabuf->ext_release_cb)
+		return;
+
+	spin_lock(&dmabuf->ext_release_lock);
+	dmabuf->ext_release_cb(dmabuf, dmabuf->ext_release_priv);
+	spin_unlock(&dmabuf->ext_release_lock);
+
+	dma_buf_unregister_release_notifier(dmabuf);
+}
+
 static void dma_buf_release(struct dentry *dentry)
 {
 	struct dma_buf *dmabuf;
@@ -75,6 +116,8 @@ static void dma_buf_release(struct dentry *dentry)
 	BUG_ON(dmabuf->cb_in.active || dmabuf->cb_out.active);
=20
 	dma_buf_stats_teardown(dmabuf);
+	dma_buf_call_release_notifier(dmabuf);
+
 	dmabuf->ops->release(dmabuf);
=20
 	if (dmabuf->resv =3D=3D (struct dma_resv *)&dmabuf[1])
@@ -642,6 +685,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_exp=
ort_info *exp_info)
 	init_waitqueue_head(&dmabuf->poll);
 	dmabuf->cb_in.poll =3D dmabuf->cb_out.poll =3D &dmabuf->poll;
 	dmabuf->cb_in.active =3D dmabuf->cb_out.active =3D 0;
+	spin_lock_init(&dmabuf->ext_release_lock);
=20
 	if (!resv) {
 		resv =3D (struct dma_resv *)&dmabuf[1];
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index 71731796c8c3..6282d56ac040 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -287,6 +287,8 @@ struct dma_buf_ops {
 	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
 };
=20
+typedef void (*ext_release_notifier_cb)(struct dma_buf *dmabuf, void *priv=
);
+
 /**
  * struct dma_buf - shared buffer object
  *
@@ -432,6 +434,15 @@ struct dma_buf {
 	 */
 	struct dma_resv *resv;
=20
+	/** @ext_release_cb notififier callback to call on release */
+	ext_release_notifier_cb ext_release_cb;
+
+	/** @ext_release_priv private data for callback */
+	void *ext_release_priv;
+
+	/** @ext_release_lock spinlock for ext_notifier helper */
+	spinlock_t ext_release_lock;
+
 	/** @poll: for userspace poll support */
 	wait_queue_head_t poll;
=20
@@ -632,4 +643,8 @@ int dma_buf_mmap(struct dma_buf *, struct vm_area_struc=
t *,
 		 unsigned long);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map);
 void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map);
+
+int dma_buf_register_release_notifier(struct dma_buf *dmabuf,
+		 ext_release_notifier_cb ext_release_cb, void *priv);
+void dma_buf_unregister_release_notifier(struct dma_buf *dmabuf);
 #endif /* __DMA_BUF_H__ */
--=20
2.25.1
