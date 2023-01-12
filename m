Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BA5666B91
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 08:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089A210E888;
	Thu, 12 Jan 2023 07:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C76B10E886
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 07:26:41 +0000 (UTC)
X-UUID: 71973d3e924a11ed945fc101203acc17-20230112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:Content-Transfer-Encoding:Content-ID:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=GX1E/yWrcBdqBMiN1Xz2aeKCbEA/y5Ah7irKN8jODNg=; 
 b=g7aTfa8LMhvSWHKDKG2+tOdu4rP5n+5wnPQVi7Yj+GEwmRGw8I/L+sqtJbDaBG0emwUm9QE7Iy9/Nd8vV4cVGCi8fxFEPRbHWHswQSOnatmSCcnzNA9cEXr0p+XJHpAig9Py3aoxgYhL9xxfodOZrVCs0aEvA9Zt6FZSdImLcC8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17, REQID:cc810692-98b1-467c-b5a0-06d7f8d64cc3, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-INFO: VERSION:1.1.17, REQID:cc810692-98b1-467c-b5a0-06d7f8d64cc3, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-5
X-CID-META: VersionHash:543e81c, CLOUDID:6fe77054-dd49-462e-a4be-2143a3ddc739,
 B
 ulkID:230112152636J7ZELXNI,BulkQuantity:0,Recheck:0,SF:17|19|102,TC:nil,Co
 ntent:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
 SA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 71973d3e924a11ed945fc101203acc17-20230112
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1723929248; Thu, 12 Jan 2023 15:26:34 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 12 Jan 2023 15:26:33 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.239)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP
 Server id
 15.2.792.3 via Frontend Transport; Thu, 12 Jan 2023 15:26:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmijT8ieYnIA7y2cwjq/r+7uZ4GWCL6A7riDiMbeByxUng+k4odsLvKS6rld6BWbof3DX5WbCuEF76Aqw8Mp9V4cCqV5VV+voiQcYgN9I+gD3Dk3I4Qo3XnX4QrfOyyGTeQmdWvttEY9Q0/Ofx56Tn551xuvjqGTn4Tk9Isol8vniy81rXzT8Ceao5k+WyeClAUjl5V+K7ipbH5/VSJ1HbXDjFI8QHVApI6gNM5mx2p9l8i0NqbcMT1D8N2Xy3bDHLewxBZZXuO83fQU5SSCfGulOqi2AojLd0RkEBNQixPKKmxIvqzT7ZFWt9pyNxn2bOKuDxyXs+k9hWRfxM0qag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7QIQs/kJZnofrWxsZKGlFZJtgf/2PRQw3Vc149hpCY=;
 b=Q+2xj2dG8e/BaRNVzKLKJbpZDxrA11pTu1eJ82L2jrXEOPqaT5qIQNB/lYbWqSZb3r4F6rr7fekCqicsaSNAWDw+YbVM8H3vyPA1k35wHMMlPv1UIEBPYhPWpi3GpV8A/6ILjsiaSUsCPUTIuvr6iH/ulN74+iz1G7PKqoLwqSH5BbgoS4fRdDq/IWa/gzYaVmk3xjQBW/sbilO7Gt/gzPioF9kE1dRaFo/TcfaoP0bdiYqDjowwqUEjwqH3DLOXkSlpkLsSvZlI7fIC4/kmYPg4O4rlFC22sq4CM5OnHp9QTnV48ONX+hv0EW+wZhq8CM7JQENNv2T7yKd97vrjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7QIQs/kJZnofrWxsZKGlFZJtgf/2PRQw3Vc149hpCY=;
 b=aMDX8ZSIblGhCh+lsgdJ63M1lvQq7f4bYyQC+2K2Kku7Hfby+zq90qMI6+oJbITHGeGSeC0IyP33ESPPgm6g8cjqNJCl0jDUhl6KOi8kwvJxw7x/XbVep88H/zAD7WUeL2y9FnOLv2Xh+Wlxp4DPMPt0LExySqWgj4oGRkB0OI0=
Received: from SI2PR03MB5339.apcprd03.prod.outlook.com (2603:1096:4:105::9) by
 SEYPR03MB6770.apcprd03.prod.outlook.com (2603:1096:101:8f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Thu, 12 Jan 2023 07:26:31 +0000
Received: from SI2PR03MB5339.apcprd03.prod.outlook.com
 ([fe80::dae4:f894:f81f:7a2b]) by SI2PR03MB5339.apcprd03.prod.outlook.com
 ([fe80::dae4:f894:f81f:7a2b%8]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 07:26:31 +0000
From: =?utf-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <Xinlei.Lee@mediatek.com>
To: "sam@ravnborg.org" <sam@ravnborg.org>
Subject: Re: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to send
 initial code time
Thread-Topic: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to
 send initial code time
Thread-Index: AQHZIXvy5e1lbNR4AkKSRYdDZpV3aq6TavGAgAKPggA=
Date: Thu, 12 Jan 2023 07:26:30 +0000
Message-ID: <fc11e97807944e3988eaa2aee4e762eb9ee5d2fb.camel@mediatek.com>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
 <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
 <Y7nWhciY7cru78lQ@ravnborg.org>
In-Reply-To: <Y7nWhciY7cru78lQ@ravnborg.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5339:EE_|SEYPR03MB6770:EE_
x-ms-office365-filtering-correlation-id: da099978-7ec5-46c3-4721-08daf46e5380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A85zVjUnmtdcUOG2v2HeEjHvslKSD90WYyr141J40px7o4bhT+mfp3PRyvWOgbtsR0Jbvx6ELSnBhHgJhvcSpvme4Sax8SO/XKc6ndqJzvsOEtfv5791jvW+i19KX0ohEqwfFQw0fz8gDH7s/c+Uhsf6W8lIm4310rBt5A4j00I2/qbAojoTN1J3GfMWhI9leeIe52Y5D6aM5Wm3FayN6B57NNxzEiFDyhyeZjeEJGkRkTv79kMWYG6ybIIyukvK8Fui09wPXJQCH2IKPhcG+vklEjfM13UqJYs6OAfzAUogC9SpcKIcIlCqmkS95q+6ihdp/ORz0qiOjMqzejLCPdOtAMt6UL8F+VMKcKbN3FfUjrMXw2qzCsFbmB4KI9PjoF3fWaoEgfP4oebG6x2JYgUWE3vPE354Bhk+Eu8vRNwpVN8x52EXDpWsdwZc/Qpv/PKFtXrUDTB3/bAJxbnxr3q6Nu18xq6Z/gic0cafi5UhPYafeojf4kB4MycuxszL0J+aR6DktJW6gtM23XzYZ12Q8ljiTApBfNB927UmLu1lGbDBrgGakSSVJzPjpLbEkhG4cKs/432yvG0zsuB6bzG7soToTv9lW5PW2V3F1lSm06O/kVwL+BPhtpFlVqmLIkxrJDiLIXEoA4k+CYmxXejgUqMZhOKpsxzdYQ8YXh+LNc4cYMuNTlDUvAqUo8T/B+XVlZcNpcK8YgNA86pnRM3kzJwcMX5aQfLOUQ/qp/yH9KE+H31ZYxWGYT4WTSnQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR03MB5339.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199015)(2906002)(85182001)(66476007)(6512007)(4326008)(8676002)(41300700001)(66446008)(6916009)(36756003)(76116006)(66946007)(91956017)(54906003)(8936002)(5660300002)(7416002)(66556008)(316002)(6506007)(6486002)(478600001)(186003)(26005)(64756008)(71200400001)(38070700005)(2616005)(86362001)(122000001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFNvaWloZjdhcmZQNzU0YVpGMWdFUld1a1JWdEVXcUdXeUdScVdjc0FsazR4?=
 =?utf-8?B?b0hhR1YrREdnYjIyVFdBSVpyUXU1RE9IWFMySDFnMnRReGV4bG9CRFVpZWNH?=
 =?utf-8?B?TEcyc2ZYa2FyUWVZdkNjSXBpcFkramNaZnA3Q2ZUS2IyVm5nNW9zOFRQdHBI?=
 =?utf-8?B?TklvV1UzRXoyWFI3NjkxODRtWk5YVFFGNHdidVEvc2M4NkIrT3N2ZnZMNXFy?=
 =?utf-8?B?ZDdOOW1sYmdaLzBVVHRwWUw1eGx4clJKa1A0TGZCUDEwWDJ4TThvSUJkVy9C?=
 =?utf-8?B?SENPT2xTMng0WDFVSk9JaENhK3JzUklPU3F3Q0p0VTk2UjZMV2JXSTBCaTZV?=
 =?utf-8?B?OG5aQXhYdkoxWWlyNytnaStWUnFMVWZQODE1NG9qNTJXWUVjZ0VIdzVCTS9K?=
 =?utf-8?B?TXRtNWtaankvWkdOME9lVnVRVjFYSEpqU0trTHRKTE9id09jWFNCb1g1YUtB?=
 =?utf-8?B?RUtKWkhqbFNQQi9VckxpdkwyNU5LZjBaSDMyc1lsQzBwcTJiZndQaUtKUzBp?=
 =?utf-8?B?WXA1cWdiWlFaNWw1RlJLM3FvZ3ZDNk4vQXljVnZOeUx1blhxN3JZdkd5UjNk?=
 =?utf-8?B?am5nTG1HYStEVUVoNnJ6SnkzNVlUT0JXbTQwNVMwYVpvcUNUb2Frb25CMjBy?=
 =?utf-8?B?Qnhvb1RnbTRKUVg5WVRSYWtUck1rTy9KU1VMMUEzRnRRUXVQS08zRXdrNHQv?=
 =?utf-8?B?WXhBSzlVM3FrS3BVaVhhRFY1V0R1VHoyV1p2QmtoRVI5RGNoRFZEZTN3OEZG?=
 =?utf-8?B?c3JsdCt5bUVNY2psc3ZqWEZFMjJwQklqYzZxVlRpR3pvOHc5NmpReCtrSnRI?=
 =?utf-8?B?QVNjdVk5WjBicm5nd0dWQXdGcmpFZzhSM015TTNKNU9WYTlSclIzWWZxWTFK?=
 =?utf-8?B?alhUMlFYbWFNcFRnYjFIcFAvUEQ5ZjM3RU9tWHV4M1ZKeFNPdzBtQXFnckEw?=
 =?utf-8?B?a2QxS283dytHQ0tVbWltSVFFa2dQdTRWVzlzdWdjSzlvVEZrcEtjdjlDblVj?=
 =?utf-8?B?WHFzb1B0V2V3K3ZKS21FcWI1V1p4OTBvaFJXclFuV1Z1emhjWjZsZllJaE9B?=
 =?utf-8?B?Nml2ZW54MWxxUTg3QXNjRENjQUR2ZzRzK2hqbHBycG4rNUVFTitwRE02NmMv?=
 =?utf-8?B?R3N5Z1VDQlVFbGhZbUMrRkJSYWo4QmQvbkFNOVNoQmN6Vk9BdXhHamZqZnll?=
 =?utf-8?B?b3Ezc3htbHprZ0t2REd3aUo0M0UyQnlXNVUvTnFMTEQ1VHZFaW9LNzZKMVVm?=
 =?utf-8?B?cllST2NUUFYrWk8zSjdjSHlmTmFjNTlmMEtIV2thb0JSa1VUZ29mcEVFY0lK?=
 =?utf-8?B?OWZrTXVMU09rWUpZTHVyblFodVZaYTBvUGtabVlpclk0QVFZV0RBRjlwaXYy?=
 =?utf-8?B?ekFJeEJHcGpiQVNJSWkvTUl1eWk0eFJRMDFiOGxqR2FXVlFCbUgzYXBMQ3A4?=
 =?utf-8?B?d2FVSW1BSzg3NGxrOEwzeWVMRjU5VGZEWnJ4bzJDUy9IbDRPVDN4VmkxejBt?=
 =?utf-8?B?SWZDMEg0eGZvVlNOZDByZlFlS2pUdXR5QTNMY3J6dCtYaW1BOFhxYVpoRGJV?=
 =?utf-8?B?ajhoN09pQXRtK3NqY0xsbjZzaG9ka2NEU0NpVDlBeGlscnEveUJGZEZaOFEv?=
 =?utf-8?B?S2NLMkhPekVyTEZlVWFhekM1N0Y5c1hhNlBkWk02eU8yZUw3cTcwNzIzdXN1?=
 =?utf-8?B?V29scGdQUXNQMEVaMTJwLzdxcFpZQ1JHOUdFUi94RG95NCs5MGZUcWk2UGNB?=
 =?utf-8?B?eHcwNVlpbnVBS2lnM3JML1p4SHluSnR0Z2s5M3VXdXZ3WGJ1VGFDY252bE04?=
 =?utf-8?B?aWE4aGd2UGJoVkhtUGJndmw1aU1HR3ZKVUlxbXgvMFl6eHk4Y21GL3BIemJU?=
 =?utf-8?B?cjBxZkZPYlk5TFNsZEJEVVVwL0RpSE1BOUkvamxmZEY2V3hNbStGYkNZRGg5?=
 =?utf-8?B?L1RPUzRLclhnUkc5VEhqMHNyUzkwZjM0WEVNZGIrMkh4MVBqc09wNjYrVmV0?=
 =?utf-8?B?TEZiQ1h3VDlKZlRvcUZqMklaS3NRekd1ZWRkU3FpcnFGV3M0WkRFbTRvN0p6?=
 =?utf-8?B?VnA1dW0zSXluNVl5SWFHTDdoQlRiUlpjMDFOQW1PSE5MMHF3SFcrN2ZqU0th?=
 =?utf-8?B?amFSMXk2ME9aajRqTW10S3pnNys2UndTNjd5dXBZN1pxcUc1dzNEWTYxQjlu?=
 =?utf-8?B?RGc9PQ==?=
Content-ID: <5E911FC50C814C4580A68C3278F4774A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5339.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da099978-7ec5-46c3-4721-08daf46e5380
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 07:26:31.0373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yrm3839g+yu2loTTnjUrK9bJlWlpYc64tQd2aN+LN4cOVCPsupb6LlTviNWIHZQC9dCLc26LxV1H25AKnRffxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6770
Content-Type: multipart/alternative;
 boundary="__=_Part_Boundary_001_486499230.1755694350"
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--__=_Part_Boundary_001_486499230.1755694350
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PHByZT4NCk9uJiMzMjtTYXQsJiMzMjsyMDIzLTAxLTA3JiMzMjthdCYjMzI7MjE6MzEmIzMyOysw
MTAwLCYjMzI7U2FtJiMzMjtSYXZuYm9yZyYjMzI7d3JvdGU6DQomZ3Q7JiMzMjtPbiYjMzI7RnJp
LCYjMzI7SmFuJiMzMjswNiwmIzMyOzIwMjMmIzMyO2F0JiMzMjsxMTowNToyMUFNJiMzMjsrMDgw
MCwmIzMyO3hpbmxlaS5sZWVAbWVkaWF0ZWsuY29tDQomZ3Q7JiMzMjt3cm90ZToNCiZndDsmIzMy
OyZndDsmIzMyO0Zyb206JiMzMjtYaW5sZWkmIzMyO0xlZSYjMzI7Jmx0O3hpbmxlaS5sZWVAbWVk
aWF0ZWsuY29tJmd0Ow0KJmd0OyYjMzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaW5j
ZSYjMzI7dGhlJiMzMjtwYW5lbCYjMzI7c3BlYyYjMzI7c3RpcHVsYXRlcyYjMzI7dGhhdCYjMzI7
dGhlJiMzMjt0aW1lJiMzMjtmcm9tJiMzMjtsY21fcmVzZXQmIzMyO3RvJiMzMjtEU0kNCiZndDsm
IzMyOyZndDsmIzMyO3RvDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtzZW5kJiMzMjt0aGUmIzMyO2luaXRp
YWwmIzMyO2NvZGUmIzMyO3Nob3VsZCYjMzI7YmUmIzMyO2dyZWF0ZXImIzMyO3RoYW4mIzMyOzZt
cyYjMzI7YW5kJiMzMjtsZXNzJiMzMjt0aGFuDQomZ3Q7JiMzMjsmZ3Q7JiMzMjs0MG1zLA0KJmd0
OyYjMzI7Jmd0OyYjMzI7c28mIzMyO3JlZHVjZSYjMzI7dGhlJiMzMjtkZWxheSYjMzI7YmVmb3Jl
JiMzMjtzZW5kaW5nJiMzMjt0aGUmIzMyO2luaXRpYWwmIzMyO2NvZGUmIzMyO2FuZCYjMzI7YXZv
aWQmIzMyO3BhbmVsDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtleGNlcHRpb25zLg0KJmd0OyYjMzI7DQom
Z3Q7JiMzMjtUaGUmIzMyO2NoYW5nZWxvZyYjMzI7c2F5cyYjMzI7JnF1b3Q7cmVkdWNlJiMzMjt0
aGUmIzMyO2RlbGF5JnF1b3Q7LCYjMzI7YnV0JiMzMjt0aGUmIzMyO3BhdGNoJiMzMjtyZW1vdmVz
JiMzMjt0aGUNCiZndDsmIzMyO2RlbGF5Lg0KJmd0OyYjMzI7QXJlJiMzMjt0aGVyZSYjMzI7b3Ro
ZXImIzMyO2RlbGF5cyYjMzI7dGhhdCYjMzI7bWFrZSYjMzI7c3VyZSYjMzI7dGhlJiMzMjsmcXVv
dDtncmVhdGVyJiMzMjt0aGFuJiMzMjs2JiMzMjttcyZxdW90OyYjMzI7aXMmIzMyO09LJiM2MzsN
CiZndDsmIzMyOw0KJmd0OyYjMzI7U2FtDQomZ3Q7JiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOw0K
Jmd0OyYjMzI7Jmd0OyYjMzI7Rml4ZXM6JiMzMjthODY5YjlkYjdhZGYmIzMyOygmcXVvdDtkcm0v
cGFuZWw6JiMzMjtzdXBwb3J0JiMzMjtmb3ImIzMyO2JvZSYjMzI7dHYxMDF3dW0tbmw2JiMzMjt3
dXhnYQ0KJmd0OyYjMzI7Jmd0OyYjMzI7ZHNpJiMzMjt2aWRlbyYjMzI7bW9kZSYjMzI7cGFuZWwm
cXVvdDspDQomZ3Q7JiMzMjsmZ3Q7JiMzMjtTaWduZWQtb2ZmLWJ5OiYjMzI7WGlubGVpJiMzMjtM
ZWUmIzMyOyZsdDt4aW5sZWkubGVlQG1lZGlhdGVrLmNvbSZndDsNCiZndDsmIzMyOyZndDsmIzMy
Oy0tLQ0KJmd0OyYjMzI7Jmd0OyYjMzI7JiMzMjtkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
Ym9lLXR2MTAxd3VtLW5sNi5jJiMzMjt8JiMzMjsxJiMzMjstDQomZ3Q7JiMzMjsmZ3Q7JiMzMjsm
IzMyOzEmIzMyO2ZpbGUmIzMyO2NoYW5nZWQsJiMzMjsxJiMzMjtkZWxldGlvbigtKQ0KJmd0OyYj
MzI7Jmd0OyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjtkaWZmJiMzMjstLWdpdCYjMzI7YS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtYm9lLXR2MTAxd3VtLW5sNi5jDQomZ3Q7JiMzMjsmZ3Q7
JiMzMjtiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMNCiZn
dDsmIzMyOyZndDsmIzMyO2luZGV4JiMzMjs4NTdhMmYwNDIwZDcuLmYwMDkzMDM1ZjFmZiYjMzI7
MTAwNjQ0DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstLS0mIzMyO2EvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYw0KJmd0OyYjMzI7Jmd0OyYjMzI7KysrJiMzMjtiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMNCiZndDsmIzMyOyZn
dDsmIzMyO0BAJiMzMjstNzgwLDcmIzMyOys3ODAsNiYjMzI7QEAmIzMyO3N0YXRpYyYjMzI7Y29u
c3QmIzMyO3N0cnVjdCYjMzI7cGFuZWxfaW5pdF9jbWQNCiZndDsmIzMyOyZndDsmIzMyO2lueF9o
ajExMGl6X2luaXRfY21kW10mIzMyOz0mIzMyO3sNCiZndDsmIzMyOyZndDsmIzMyOyYjMzI7fTsN
CiZndDsmIzMyOyZndDsmIzMyOyYjMzI7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjsmIzMyO3N0YXRpYyYj
MzI7Y29uc3QmIzMyO3N0cnVjdCYjMzI7cGFuZWxfaW5pdF9jbWQmIzMyO2JvZV9pbml0X2NtZFtd
JiMzMjs9JiMzMjt7DQomZ3Q7JiMzMjsmZ3Q7JiMzMjstX0lOSVRfREVMQVlfQ01EKDI0KSwNCiZn
dDsmIzMyOyZndDsmIzMyOyYjMzI7X0lOSVRfRENTX0NNRCgweEIwLCYjMzI7MHgwNSksDQomZ3Q7
JiMzMjsmZ3Q7JiMzMjsmIzMyO19JTklUX0RDU19DTUQoMHhCMSwmIzMyOzB4RTUpLA0KJmd0OyYj
MzI7Jmd0OyYjMzI7JiMzMjtfSU5JVF9EQ1NfQ01EKDB4QjMsJiMzMjsweDUyKSwNCiZndDsmIzMy
OyZndDsmIzMyOy0tJiMzMjsNCiZndDsmIzMyOyZndDsmIzMyOzIuMTguMA0KDQpIaSYjMzI7U2Ft
Og0KDQpUaGFua3MmIzMyO2ZvciYjMzI7eW91ciYjMzI7cmVwbHkhDQoNClBsZWFzZSYjMzI7YWxs
b3cmIzMyO21lJiMzMjt0byYjMzI7ZXhwbGFpbiwmIzMyO2luJiMzMjt0aGUmIzMyO2JvZV9wYW5l
bF9wcmVwYXJlJiMzMjtmdW5jdGlvbiYjMzI7aW4mIzMyO3RoaXMmIzMyOw0KZmlsZSwmIzMyO3Ro
ZXJlJiMzMjt3aWxsJiMzMjtiZSYjMzI7YSYjMzI7Nm1zJiMzMjtkZWxheSYjMzI7YWZ0ZXImIzMy
O3RoZSYjMzI7cmVzZXQmIzMyO3BpbiYjMzI7aXMmIzMyO3B1bGxlZCYjMzI7aGlnaCYjMzI7DQoo
Z3Bpb2Rfc2V0X3ZhbHVlKGJvZS0mZ3Q7ZW5hYmxlX2dwaW8sJiMzMjsxKSksJiMzMjthbmQmIzMy
O3RoZSYjMzI7aW5pdGlhbCYjMzI7Y29kZSYjMzI7d2lsbCYjMzI7YmUmIzMyOw0Kc2VudCYjMzI7
aW4mIzMyO3RoZSYjMzI7Ym9lX3BhbmVsX2luaXRfZGNzX2NtZCYjMzI7ZnVuY3Rpb24mIzMyO2xh
dGVyLCYjMzI7VGhpcyYjMzI7cGVyaW9kJiMzMjtvZiYjMzI7dGltZSYjMzI7DQplbnN1cmVzJiMz
Mjt0aGF0JiMzMjt0aGUmIzMyO2RlbGF5JiMzMjtpcyYjMzI7d2l0aGluJiMzMjt0aGUmIzMyO3Nw
ZWNpZmllZCYjMzI7cmFuZ2UuDQoNCkluJiMzMjthZGRpdGlvbiwmIzMyO0kmIzMyO3dpbGwmIzMy
O2FkZCYjMzI7YSYjMzI7c3BlY2lhbCYjMzI7cGFuZWwmIzMyO2NvbnRyb2wmIzMyO2luJiMzMjt0
aGUmIzMyO1YyJiMzMjt2ZXJzaW9uLCYjMzI7aWYmIzMyOw0KeW91JiMzMjtoYXZlJiMzMjthbnkm
IzMyO3F1ZXN0aW9ucywmIzMyO3dlJiMzMjt3aWxsJiMzMjtkaXNjdXNzJiMzMjtpdCYjMzI7bGF0
ZXIuDQoNCkJlc3QmIzMyO1JlZ2FyZHMhDQp4aW5sZWkNCg0KPC9wcmU+PCEtLXR5cGU6dGV4dC0t
PjwhLS17LS0+PHByZT4qKioqKioqKioqKioqIE1FRElBVEVLIENvbmZpZGVudGlhbGl0eSBOb3Rp
Y2UNCiAqKioqKioqKioqKioqKioqKioqKg0KVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0
aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55IA0KYXR0YWNobWVudHMpIG1heSBiZSBj
b25maWRlbnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UNCmV4ZW1w
dCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJsZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0
byBiZSANCmNvbnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkg
dXNlLCBkaXNzZW1pbmF0aW9uLCANCmRpc3RyaWJ1dGlvbiwgcHJpbnRpbmcsIHJldGFpbmluZyBv
ciBjb3B5aW5nIG9mIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgaXRzIA0KYXR0YWNobWVudHMpIGJ5
IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heSAN
CmJlIHVubGF3ZnVsLiBJZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhp
cyBlLW1haWwsIG9yIGJlbGlldmUNCiANCnRoYXQgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1h
aWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciANCmltbWVkaWF0ZWx5IChieSBy
ZXBseWluZyB0byB0aGlzIGUtbWFpbCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgDQp0
aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGFueSBhdHRhY2htZW50cykgZnJvbSB5b3VyIHN5c3RlbSwg
YW5kIGRvIG5vdA0KZGlzY2xvc2UgdGhlIGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90
aGVyIHBlcnNvbi4gVGhhbmsgeW91IQ0KPC9wcmU+PCEtLX0tLT4=

--__=_Part_Boundary_001_486499230.1755694350
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCAyMDIzLTAxLTA3IGF0IDIxOjMxICswMTAwLCBTYW0gUmF2bmJvcmcgd3JvdGU6DQo+
IE9uIEZyaSwgSmFuIDA2LCAyMDIzIGF0IDExOjA1OjIxQU0gKzA4MDAsIHhpbmxlaS5sZWVAbWVk
aWF0ZWsuY29tDQo+IHdyb3RlOg0KPiA+IEZyb206IFhpbmxlaSBMZWUgPHhpbmxlaS5sZWVAbWVk
aWF0ZWsuY29tPg0KPiA+IA0KPiA+IFNpbmNlIHRoZSBwYW5lbCBzcGVjIHN0aXB1bGF0ZXMgdGhh
dCB0aGUgdGltZSBmcm9tIGxjbV9yZXNldCB0byBEU0kNCj4gPiB0bw0KPiA+IHNlbmQgdGhlIGlu
aXRpYWwgY29kZSBzaG91bGQgYmUgZ3JlYXRlciB0aGFuIDZtcyBhbmQgbGVzcyB0aGFuDQo+ID4g
NDBtcywNCj4gPiBzbyByZWR1Y2UgdGhlIGRlbGF5IGJlZm9yZSBzZW5kaW5nIHRoZSBpbml0aWFs
IGNvZGUgYW5kIGF2b2lkIHBhbmVsDQo+ID4gZXhjZXB0aW9ucy4NCj4gDQo+IFRoZSBjaGFuZ2Vs
b2cgc2F5cyAicmVkdWNlIHRoZSBkZWxheSIsIGJ1dCB0aGUgcGF0Y2ggcmVtb3ZlcyB0aGUNCj4g
ZGVsYXkuDQo+IEFyZSB0aGVyZSBvdGhlciBkZWxheXMgdGhhdCBtYWtlIHN1cmUgdGhlICJncmVh
dGVyIHRoYW4gNiBtcyIgaXMgT0s/DQo+IA0KPiAJU2FtDQo+IA0KPiA+IA0KPiA+IEZpeGVzOiBh
ODY5YjlkYjdhZGYgKCJkcm0vcGFuZWw6IHN1cHBvcnQgZm9yIGJvZSB0djEwMXd1bS1ubDYgd3V4
Z2ENCj4gPiBkc2kgdmlkZW8gbW9kZSBwYW5lbCIpDQo+ID4gU2lnbmVkLW9mZi1ieTogWGlubGVp
IExlZSA8eGlubGVpLmxlZUBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9wYW5lbC9wYW5lbC1ib2UtdHYxMDF3dW0tbmw2LmMgfCAxIC0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJt
L3BhbmVsL3BhbmVsLWJvZS10djEwMXd1bS1ubDYuYw0KPiA+IGluZGV4IDg1N2EyZjA0MjBkNy4u
ZjAwOTMwMzVmMWZmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5l
bC1ib2UtdHYxMDF3dW0tbmw2LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFu
ZWwtYm9lLXR2MTAxd3VtLW5sNi5jDQo+ID4gQEAgLTc4MCw3ICs3ODAsNiBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHBhbmVsX2luaXRfY21kDQo+ID4gaW54X2hqMTEwaXpfaW5pdF9jbWRbXSA9IHsN
Cj4gPiAgfTsNCj4gPiAgDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfaW5pdF9jbWQg
Ym9lX2luaXRfY21kW10gPSB7DQo+ID4gLQlfSU5JVF9ERUxBWV9DTUQoMjQpLA0KPiA+ICAJX0lO
SVRfRENTX0NNRCgweEIwLCAweDA1KSwNCj4gPiAgCV9JTklUX0RDU19DTUQoMHhCMSwgMHhFNSks
DQo+ID4gIAlfSU5JVF9EQ1NfQ01EKDB4QjMsIDB4NTIpLA0KPiA+IC0tIA0KPiA+IDIuMTguMA0K
DQpIaSBTYW06DQoNClRoYW5rcyBmb3IgeW91ciByZXBseSENCg0KUGxlYXNlIGFsbG93IG1lIHRv
IGV4cGxhaW4sIGluIHRoZSBib2VfcGFuZWxfcHJlcGFyZSBmdW5jdGlvbiBpbiB0aGlzIA0KZmls
ZSwgdGhlcmUgd2lsbCBiZSBhIDZtcyBkZWxheSBhZnRlciB0aGUgcmVzZXQgcGluIGlzIHB1bGxl
ZCBoaWdoIA0KKGdwaW9kX3NldF92YWx1ZShib2UtPmVuYWJsZV9ncGlvLCAxKSksIGFuZCB0aGUg
aW5pdGlhbCBjb2RlIHdpbGwgYmUgDQpzZW50IGluIHRoZSBib2VfcGFuZWxfaW5pdF9kY3NfY21k
IGZ1bmN0aW9uIGxhdGVyLCBUaGlzIHBlcmlvZCBvZiB0aW1lIA0KZW5zdXJlcyB0aGF0IHRoZSBk
ZWxheSBpcyB3aXRoaW4gdGhlIHNwZWNpZmllZCByYW5nZS4NCg0KSW4gYWRkaXRpb24sIEkgd2ls
bCBhZGQgYSBzcGVjaWFsIHBhbmVsIGNvbnRyb2wgaW4gdGhlIFYyIHZlcnNpb24sIGlmIA0KeW91
IGhhdmUgYW55IHF1ZXN0aW9ucywgd2Ugd2lsbCBkaXNjdXNzIGl0IGxhdGVyLg0KDQpCZXN0IFJl
Z2FyZHMhDQp4aW5sZWkNCg==

--__=_Part_Boundary_001_486499230.1755694350--

