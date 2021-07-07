Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01603BEA7F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 17:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01A16E17D;
	Wed,  7 Jul 2021 15:15:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6350A6E17D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 15:15:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="189003999"
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="189003999"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 08:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,331,1616482800"; d="scan'208";a="410579986"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 07 Jul 2021 08:15:00 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 08:14:59 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 7 Jul 2021 08:14:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 7 Jul 2021 08:14:59 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Wed, 7 Jul 2021 08:14:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LN8FQ30ftE+1IRj9ZSBanD6oaixJfMypB3P5kbi4a38XzJyQhnzDqNRsg3ozzxu0WLs9L3g3Zf5huasS9kLsIwz0ikPvJn9fk9f3nXe2DGVvMxwbglrZAsypKXA1QxscZKANzX6DmEkpNkQDKpLy1e7wKpbY7si4Oqh5B7XmjT5RFqZ8TVoNc0TeXrS7/tXTAYZf+qemfNVfbsu3gTfPY5QlxypNPQlRT1rTxSx3jfFR8sqRibVO18mSOvC4gFQCoFXvkpHNE0eKYgk/VotLvxoR5dXsk/pdvbD+MqV15gcjjp+OEMNGDT4Ew2V9hsYswmnXI97IPzu0YFDU/rxIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmGztk5Kme5W6kLjT1CqtGXG+KHvo/6J/AGWEX5vpao=;
 b=UQsyJIZMGKNAPiVDBqeP7FyI1Fk7CGwQfc/GzQZxZV+u1h6dXZvdtj/YAMbMgqzuX574vhhQDZHeYaObBpVtaDx4/etnBuhTmVZIG5rBsZ7YGgar30f3SFrO6Rq4MRtbo0V0Z5pEmTmEYR4KZoWuUDR3/C0E4qzw26tGj5ln4nVZvSDB6KQE4kRO+6mAUZZERP7h56CT3aTAI23KoZB/a8679HcawxZhytm9YXue7Y+csbC4hrNYxPXA9R7KLH0zGoyWIR0Lui2Xt7+rekF+5UibW4GsIAObo/nmfJ59Lnn5SSAXajX16Mw/cAm4j1Budu4JDbcuyeC2Ez2hMCs9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmGztk5Kme5W6kLjT1CqtGXG+KHvo/6J/AGWEX5vpao=;
 b=EjtLzyCDEjBGayODEOWq/VLPI1j5hgaQODvi2wCs0+16iqX9rlkiC5cQB/gfHpRAqz+Da7ILmD2jexbVJtMuAJ3xQ4sTTZkO4wKhYyqiMoxND/WmLBlemUH7kk5/Sl5/BW7pAeCOBdXlV1LiExU9R9/DTcqU3eigHDukYcmtZxE=
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5668.namprd11.prod.outlook.com (2603:10b6:5:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Wed, 7 Jul
 2021 15:14:56 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::396d:8a2a:b789:55b7%5]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 15:14:56 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: RE: [PATCH] drm/dp: follow DP link CTS spec to read link status back
Thread-Topic: [PATCH] drm/dp: follow DP link CTS spec to read link status back
Thread-Index: AQHXcz/3TbXq7aRHX0yJP/gQ8YwF0qs3nHwAgAABlPA=
Date: Wed, 7 Jul 2021 15:14:56 +0000
Message-ID: <CO6PR11MB5651A068B1CBC58E83230762A31A9@CO6PR11MB5651.namprd11.prod.outlook.com>
References: <20210707150042.6376-1-shawn.c.lee@intel.com>
 <j5Uvw-gNT4Egur_E6SsYoqn09GYXBESdyvFJ7GTdVjIbEQcnysdO4wJtgcsQk_u-lHzyQtQjY6-Ahz66UaQFaaw2ZWZPxkZMzMwMaP5YEr0=@emersion.fr>
In-Reply-To: <j5Uvw-gNT4Egur_E6SsYoqn09GYXBESdyvFJ7GTdVjIbEQcnysdO4wJtgcsQk_u-lHzyQtQjY6-Ahz66UaQFaaw2ZWZPxkZMzMwMaP5YEr0=@emersion.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26337822-6400-4ac8-9cf7-08d94159fac1
x-ms-traffictypediagnostic: CO6PR11MB5668:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO6PR11MB56685D76A77751A4DA561BCEA31A9@CO6PR11MB5668.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A+h2xDlQE4ZX2urBBVybj1e1w0LOfqtRBs8o9x1ZzvEnzY27qgwUyv3xOI2CC3pdKY/lex/03iBe5C86uwJ9itvvPDXBBCP2tfuGeIah1YQrz67NiYiG0tGksUN/uX6fgdevh2i6ERLG2NbxVmWWFUsi9/7TnwB8GAv16pf3MfSWXU+LFXSHWD2Yvl0l8kn4p4mLv5SOId8rhFE2pSTpcci7TnLtM32+YAipdGNTO6W1e2SvpwLab9MA8lC8tYWkeRI4Rx4d1dXgZqAsmOegPgcYJ97s9kN4ZISH2strudAUPrSX7HbTuMpuqy+BTpm24SdKupAfg5W98Dv3bRVLCKa6HjMI3W5DYjXfPWSNIJSHpF5/ycIRrEBYwC5NLSRfQ/2baMliZTRtNbEOerN1xyU7PVwdUVBXC1GiWaGFgDfOd05kEuUfzIJ4ZPbc5fBOATyt5VHRA9q5obxiSBRYfj+iwyN0xs6mKr6+7BKqX4ZcCoxceiwbMb94oCR/RAHGTb2N01Ej9fPDk2wAdX4H23Z0wCmdRQM10bVF7RoWRVttaYgo4DILOB0J0h9UsaKm4F6VCgKzgyrLqQyCCzv3ZvvCaP1Fq7vat4defWgdSAY9DAoHDkvDCE+GED4SlUcD2V+DuruPi431gv6WSgw/3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(38100700002)(5660300002)(64756008)(8936002)(8676002)(66446008)(66556008)(33656002)(6916009)(66946007)(86362001)(7696005)(558084003)(52536014)(498600001)(66476007)(8796002)(71200400001)(2906002)(76116006)(55236004)(26005)(6506007)(9686003)(107886003)(186003)(55016002)(83380400001)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RhY3tAb4FJ1UOiCbEDD3svQ6MyuHIdWX0Y+aSML99jvmjiaJVi7monA4xTHH?=
 =?us-ascii?Q?NO4f4bgw1zEo4yZZCHsbsVdCrRffhDmjcBs2VwGc1mdz1mo6fc6oNDLLA/+W?=
 =?us-ascii?Q?yWHWq98+IO44LF/pOCqy+25Qvv5UruOQimotkJPXQsFqU9w7mOViAnVaAjhR?=
 =?us-ascii?Q?2bxK6yYdiNYTgT6CZIoBJpPU48U3UAcaQ0+uyl8fB2rWlpTX2WVoqKfEPfgu?=
 =?us-ascii?Q?lp4gGHmGQZwKZlu/F4yyb76vXpwDAHX+UYfHWW2J4HfDUkrrLI8CQiaCZPBX?=
 =?us-ascii?Q?4gpgTBYclvYtgpeUyGU/FcNws5JO9JcI3jn4NOcw1DUiL3ruBDaOhMZgDdAk?=
 =?us-ascii?Q?3ySflMnAHbpu17HFsY/rhlDeTIzHUULL0vtYbQ0veMDFcp0XcjMpdK3n3Dya?=
 =?us-ascii?Q?s8vqyY+UJbHygh18VCDzcGQwS+letJOsfs2CafbQjsFy5Z89FDpMA/Dmv+47?=
 =?us-ascii?Q?UXyChfVdSJUC5ErrdmbEPa83Mg5p6SEfp+/SJttlCiNGXX66fQ7uFL0i6bMa?=
 =?us-ascii?Q?W9IvetFw4dUM1k2LRcgQWNd4v1iA2RFQ01l8NGd5NF3U608JXGKFqgX/ILPi?=
 =?us-ascii?Q?Yd5spKn2L+mG+fGNBK4cEdcjFgMyV+NGBajokbhGkz9mvJgec7F1xfr5unB6?=
 =?us-ascii?Q?Gb9RzF/3o67gUdfiMOizNnUM7zQjXgXZIsfWGYU9a7mXlPhQfIgs1CFGbCBA?=
 =?us-ascii?Q?QvQLEG+66QXuGJxdHEJqjJhQ5mS/CxXjRWbTDBF9iIhTi8HGmppuAxv/Tlc7?=
 =?us-ascii?Q?FcpvikRPxeNaiuSJxfqHMGD4wrr3ZEZic/A7GAPZK/qeWVlraJAlZy+qek2q?=
 =?us-ascii?Q?nesNzgaTZTxqMrtJ+DtOvkP+87AiMIeQn4Vf+zeAsvEulI899wKMUj2kAbJA?=
 =?us-ascii?Q?nNGUGdGy/RCBETNGzaxN95ueG0GcP8WM+M65Z3C1G/Tr++RbD6Viqoed7O0X?=
 =?us-ascii?Q?4AYF9QvNQeOvr/CCnwl8HBxzFhr4+tEbqg8z/sQtJlBnowjj6xBl8WLkqe8R?=
 =?us-ascii?Q?Y35yTXFcF3ZYZyAVriPYIPmz0kV1Y5vCepo23v4DURDy3wJ0UgzswOllX5qO?=
 =?us-ascii?Q?0GNsJXkd/QS61FYUUhKjrEUtQxgb5tEvXeiZFGr3CuQYlQrsgJlSjeComYH+?=
 =?us-ascii?Q?vr/+JQOqIOP+/cAnZnPh8wCoIt8AFJam2rcxLHAizz5l7iRx5ljPI+gQXQPn?=
 =?us-ascii?Q?8jFot6uNavJz1DC8vlGgJhqnd3soAOZin0+2z+3BC2kj7u+1CJRtezlsyJsm?=
 =?us-ascii?Q?IJINjfiljsW6Y4Tqy4vmR6qlABSfd6lho/h5QIve6B+Tjokudw7whCJWOf0M?=
 =?us-ascii?Q?vJDtW7qH5WLFV8qbzoToFHmR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26337822-6400-4ac8-9cf7-08d94159fac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 15:14:56.3746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUYGtboljo8yE1vuHIjZXl+5PwqXHm6iPegzky7fLAqaPpZG2PDuo9WiMq+LDC12koEoTVxNPUcWKKx6TP37jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5668
X-OriginatorOrg: intel.com
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
Reply-To: "20210707150042.6376-1-shawn.c.lee@intel.com"
 <20210707150042.6376-1-shawn.c.lee@intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>, "Chiou,
 Cooper" <cooper.chiou@intel.com>, "Tseng, William" <william.tseng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, July 7, 2021, 3:05 p.m., Simon Ser <contact@emersion.fr> wrote:
>> +				       DP_LINK_STATUS_SIZE + 2);
>
>Suggestion: use sizeof(full_link_stat) here instead to avoid this getting =
out-of-sync with the real array size?
>
I will update v2 patch later. Thanks for comment!

Best regards,
Shawn
