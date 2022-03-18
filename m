Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B240D4DE327
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 22:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB3210E079;
	Fri, 18 Mar 2022 21:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D3310E079
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 21:00:33 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22IK059D032190; 
 Fri, 18 Mar 2022 21:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Sdodyr3bfTfd8gu0VThvY5O5lV054UgXF//hpO/YGkk=;
 b=yqiqn3q5hjdBniA/IBjBnv4YDHCuIqNhdR8W1rygLwZttih5istVeV4DPYemiSQt2AMP
 aYyyRuLfSqdf5gu7GGeGs1fWtXFdV9ga9XO9fizPFVpxC+jRkczgrx+DnkdTxuJQjLIj
 dzTW5YgLXVS4ZRqyCPd338Q2vEsbb5rpQ5uKqgE6dYVLgG7hdwOa1tIBfsvCxauzAeH9
 IkhsgOSN7AJiXDd0uu/66nB3zY6Aonrt/PIVWAnPBsENCBv6v67Puqpd/im4aJMsyqFY
 zFcP0jDTXYGhnW72TFILtgHHKIb/+kLzPiYugQSGlcgw+0gLpCrLCnC3cqWIpi1oXcv6 9A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et60rvvuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 21:00:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IKqVbY008014;
 Fri, 18 Mar 2022 21:00:31 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by aserp3020.oracle.com with ESMTP id 3et64n0dqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 21:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuMU2fALsxuAl8cj1AqDGEJgvYFUo+E7UXYE1myM4hRwgkcrSA8OVVOnyBp08/wSOvW86mMtyREzE8h3gzKYLk823X/oXstRuDyLxvjZJ/xi5dNZG/S9ouLxRJfIy30NTPyr7AXpTmjXvIe3yCvzvK+ljkmkBbzoHEQEMtJJaL+H51yEIZc13O1Hfb/S8VGMSmctfXVdGqqNSJMq4djF3hZtzBDAQwVy+t/7nx10Z0pMxImeMHDzAI5BEmGpuXdMqzJE/A/HjNBvvFPiHEXZDk+FcsG6AjJUVXnsndt+C/F9Rwy5dfOeuUInQqd7aiLOjFdJ6I7YPaBEdO9eSpGZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sdodyr3bfTfd8gu0VThvY5O5lV054UgXF//hpO/YGkk=;
 b=laQ3FOu1ehvkMGYA9MVQQyb0epBfKcuutnj4Bym2HjlGalIjN6gXzqV+B+b2QYmx1W3pnPvwADLA8WYQS73kpdtFn0RV3Jx3uHe9T1lXbYOsZm+i+M5xCErMshkrPTTBR5bhLg8ps9/9jGyzNH9mR9Mv+YT0ldXyvrc0f4MkDIbEeoZCd/zC0ZzoGLElBZfM8P5U+vdwKe6eWKm2+0JLOJXArJU9HUxRw1bAi9Dp9ZdoIw0xgus9pVh6cnorF2lhMsMm36CFFIceYBvtoAd0ew2HUrUiNtnV7TFk4F6GdaTdNncRKB9QkWxc2CRFnE4gGbRtXmOZk82GVuQhmScjFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sdodyr3bfTfd8gu0VThvY5O5lV054UgXF//hpO/YGkk=;
 b=uJ7HKJLLtbg86Ef3m6QDSIJqMdgIahxdeTm/CRHocLNGgptSBGUacgXBqprTlR8VWtRUJsFh8sogH3lUa1dgN63A/xC8jXKKq9DEfqpldtlPt5lKrMB3JD+y/trCTV7nS1cimfZaoCbixWx+YM/DCbgu1+/yusMsBtCuqYcOaYg=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by DM6PR10MB4107.namprd10.prod.outlook.com (2603:10b6:5:17a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 18 Mar
 2022 21:00:29 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::94c5:42b1:5147:b6f0]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::94c5:42b1:5147:b6f0%6]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 21:00:29 +0000
From: Chuck Lever III <chuck.lever@oracle.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH 1/5] drm/vmwgfx: Fix an invalid read
Thread-Topic: [PATCH 1/5] drm/vmwgfx: Fix an invalid read
Thread-Index: AQHYOu++5qVTaJO4z0OxaUNz7TVG7qzFoIQA
Date: Fri, 18 Mar 2022 21:00:29 +0000
Message-ID: <4253BBB9-2D52-41F2-9F0C-B01D67DD2629@oracle.com>
References: <20220318174332.440068-1-zack@kde.org>
 <20220318174332.440068-2-zack@kde.org>
In-Reply-To: <20220318174332.440068-2-zack@kde.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae01a93b-f8b5-4b42-6cd7-08da092255be
x-ms-traffictypediagnostic: DM6PR10MB4107:EE_
x-microsoft-antispam-prvs: <DM6PR10MB4107D58C426FEB3CD7CB766893139@DM6PR10MB4107.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sf8f3xiTSd+w6V0RdFEKzLmTWUlUvGG5G/2wdnNMNEIxwIQbOovzt7N3qlIePYJpxwwurRImof96yt4yJEKBVRP7bAvlzMLP6vA9SoeMx77MDTMP06Kxu8e/WL7vLkDidEu7J8kuBvjHT35G+zBNRaW/N8k6IE35GgKuJbyayOoFRIK2KuN8y9A39OkWz0rhkwDXbmZgmarQhR0pEWKjdmoyM254DMPTMNkkrD7SPvJfKeeVj7tb+8fMoepu784YrabI6yR1ykDQeToQAikY7IsXSAAXIijbzgPMfd9ORLkPUddQYARzXdkttjzF/xTyPhuTUSlZnMgymaRt7jfJRNLOv0gPbBiPrU/AmQZ9eY5G8RPiFgdiIFWobXwz3fBoUn425K0Fn6sEbSChTrWOQMnhA/jxNxUgq+DdmUsI/q17WUN4s0ZA4l7Tu2Ct8U8pzHm2M40hmTQ7COBwSSRVyfCHio3zevzF5GTt0y/iLyqr3d1ymmnAPDgV+Zha8vE8rx+AptCDXw+pZN7T2gv0joUCnsp13zmE1E1Gbwobku8vUXhw7ZnIr1/0jWIvyb0LIa6ncwmNowEIFfhn9/QiryFRPI8eNu7Zj2VtcADgxRojd6MP3aNa5lcHXezz+tKxDrS5y/rrBsBz9I2hcmWb95D0n84D08YwjDv7vE/+UUpP5l4V1fkOPJbs2k4i6D/hp6etUFUDvSVJoqvRNKahFFm1WCi0kvp4KOhzp/22+VrKy+VvqOmkxMaZSn23rUVx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(53546011)(316002)(6486002)(6506007)(8676002)(4326008)(36756003)(33656002)(2906002)(64756008)(66446008)(66476007)(91956017)(66946007)(66556008)(76116006)(86362001)(5660300002)(122000001)(38100700002)(38070700005)(8936002)(508600001)(71200400001)(6512007)(6916009)(2616005)(186003)(26005)(54906003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1pozunC7Mi3ptLR3xALDBwjx6zvYeLg0bSZ4gCfDifTk0gr5/ezc6dNL3/7g?=
 =?us-ascii?Q?XrffTJGv/hP5jsbKx0xjuSEkGFe3Qy1eXL0dPQTpXfIU9shELFdmuEBWNwI+?=
 =?us-ascii?Q?jyLBk0JoG9J0RaFtQA2nGDFbprE6LGfagvxPWLL2c8GMvuXy9NqArtqKdAWl?=
 =?us-ascii?Q?N3GoGsR3SZSbPyu2j5qU1ytixs6XidLpUwB2tF2qRaSmTXXmC6mwZGijhg34?=
 =?us-ascii?Q?jfu4fI6AasWCp13s3LLMJhYWbcuXElptNFlW07X6gPx19JTU4I9QSXKYPpRW?=
 =?us-ascii?Q?IPzxMcMz0GW4SeKMiCNLAyXZsS/RzCaXYmv9o8olNw+EOa+54An5ax7gBujg?=
 =?us-ascii?Q?iwFXObHFBXx50XRaV8iErLMy/+Y/h+W4gGkUPso5H/u02DL2na/4ENbcAvpB?=
 =?us-ascii?Q?LfJy0kpp4xscxE5Xknhg346A3K+4loIuWdDWw7mm8FgloPVo4fDUI8+31jqt?=
 =?us-ascii?Q?FJfmLfNrOLMEiF2QCMRBMRBit+mAvbwks089uOaYoGULlkJ5WxG5okv8H/xn?=
 =?us-ascii?Q?8p4sSINfxvZ5Jye0ZGeWVHwy0Kkfi0vYleQ+0J3mGzBIeV7U/GlIKM5kY1B+?=
 =?us-ascii?Q?nUSewrMhsfKiubfiaqLR5Koaoj8Cz4yRlXhxwMLujhBq6FBWSbaYB0KEHhV+?=
 =?us-ascii?Q?aiRgFUImWuG6DDwt2I7gXGL70P8G5wNFRzyKi54q/gNXRlYDnGbq3ZKG5Lud?=
 =?us-ascii?Q?DFUU/Sh3dPIg4pPQ5E8KWsrO4W5IFT+zr30V0FEFnMpaBcPiuLPD2+RnnlEs?=
 =?us-ascii?Q?vubW+sHd9FPa+dMpAiyY/fYH4QTAHqnig0onM0KSR8WgpNwDP0SQP7DaNSp+?=
 =?us-ascii?Q?H7xaimUIXDwrkuqHgG9kBRaif1/M5oXHrzINXvfwsJJzCgrKIZCwEOBVVw4z?=
 =?us-ascii?Q?JB96Anx3+TBt+wwCpS4Vc8j7BgW2pS9iJWcFHegbs11ziIEyic/IYAxtDY/b?=
 =?us-ascii?Q?J88WzYq3g9IhIHZvOXOfl9nvW0RQpfxu2EvkM86NJnc9PQiL++C6O7mSKNti?=
 =?us-ascii?Q?Xh+YznwBDE3NzjwAWp77qU4wPGvBkLWwzyO5Umh6qv73tNOmb/TqMQYMH/Ac?=
 =?us-ascii?Q?iDbAi7Q+zxZblkqd8uCff5UXXB2/RpJLlvYT6/LD9GmmIh102/y5oCJqEuzx?=
 =?us-ascii?Q?gwn2ekarIJQPwSpLb1t3FgiZjkOstoI6t6fuScfV1P0OcBuoyBzTQFimxTF1?=
 =?us-ascii?Q?qSXr0CPSEBbuwLIUb9Xtv2F8hNgZhEJ64IaqzeMoiMK7oUBqMqowvAlOyvXZ?=
 =?us-ascii?Q?h3iMMl0fAChk6vi7bLiF9mJLrEPzISeC2SXEtDgvP8PtZooE2QnnvTNY5jNk?=
 =?us-ascii?Q?5dNVqrrgrxSq4eQhORnlARcjUflYI1yFTSRgBTMJ1+oH6DcqfIYFhSHSqGxY?=
 =?us-ascii?Q?wqFBPFQkutGaa4nNmcjqa1Ht0+GBm5+5FwhA4ntpzHXgqhQBssoEh9O3zHuo?=
 =?us-ascii?Q?zFpJ5Kt9BNNjYWiv3jofmZH9cgHZU6CZfWOhSMDMx4XDqJFK0SYMjg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <53AD6384F4338640A7AD16FB78468509@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae01a93b-f8b5-4b42-6cd7-08da092255be
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 21:00:29.7646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wSldSWp301g9UfQdJFFCCL8uzHx26zFZ42bj3QTM0lact/gRZKqIZ3LzD2SeP27JfziiS0LEeh7bc34FKLOKHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4107
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10290
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180111
X-Proofpoint-ORIG-GUID: TZbyOcYN52unjLbouA8Dsq5VgH7uDh5t
X-Proofpoint-GUID: TZbyOcYN52unjLbouA8Dsq5VgH7uDh5t
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
Cc: "krastevm@vmware.com" <krastevm@vmware.com>,
 "mombasawalam@vmware.com" <mombasawalam@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zack-


> On Mar 18, 2022, at 1:43 PM, Zack Rusin <zack@kde.org> wrote:
>=20
> From: Zack Rusin <zackr@vmware.com>
>=20
> vmw_move assumed that buffers to be moved would always be
> vmw_buffer_object's but after introduction of new placement for mob
> pages that's no longer the case.
> The resulting invalid read didn't have any practical consequences
> because the memory isn't used unless the object actually is a
> vmw_buffer_object.
> Fix it by moving the cast to the spot where the results are used.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: f6be23264bba ("drm/vmwgfx: Introduce a new placement for MOB page =
tables")
> Reported-by: Chuck Lever III <chuck.lever@oracle.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>

After applying this patch, I am not able to reproduce the
KASAN splat I reported earlier this week.

Tested-by: Chuck Lever <chuck.lever@oracle.com>


> ---
> drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 14 ++++++--------
> 1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_resource.c
> index 708899ba2102..6542f1498651 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -859,22 +859,21 @@ void vmw_query_move_notify(struct ttm_buffer_object=
 *bo,
> 	struct ttm_device *bdev =3D bo->bdev;
> 	struct vmw_private *dev_priv;
>=20
> -
> 	dev_priv =3D container_of(bdev, struct vmw_private, bdev);
>=20
> 	mutex_lock(&dev_priv->binding_mutex);
>=20
> -	dx_query_mob =3D container_of(bo, struct vmw_buffer_object, base);
> -	if (!dx_query_mob || !dx_query_mob->dx_query_ctx) {
> -		mutex_unlock(&dev_priv->binding_mutex);
> -		return;
> -	}
> -
> 	/* If BO is being moved from MOB to system memory */
> 	if (new_mem->mem_type =3D=3D TTM_PL_SYSTEM &&
> 	    old_mem->mem_type =3D=3D VMW_PL_MOB) {
> 		struct vmw_fence_obj *fence;
>=20
> +		dx_query_mob =3D container_of(bo, struct vmw_buffer_object, base);
> +		if (!dx_query_mob || !dx_query_mob->dx_query_ctx) {
> +			mutex_unlock(&dev_priv->binding_mutex);
> +			return;
> +		}
> +
> 		(void) vmw_query_readback_all(dx_query_mob);
> 		mutex_unlock(&dev_priv->binding_mutex);
>=20
> @@ -888,7 +887,6 @@ void vmw_query_move_notify(struct ttm_buffer_object *=
bo,
> 		(void) ttm_bo_wait(bo, false, false);
> 	} else
> 		mutex_unlock(&dev_priv->binding_mutex);
> -
> }
>=20
> /**
> --=20
> 2.32.0
>=20

--
Chuck Lever



