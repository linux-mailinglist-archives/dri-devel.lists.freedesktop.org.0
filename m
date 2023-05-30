Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B9D716836
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91DE10E187;
	Tue, 30 May 2023 15:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2087.outbound.protection.outlook.com [40.107.101.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1E910E180;
 Tue, 30 May 2023 15:57:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gcvxT8HHQMLF34DQHOk7Y2FAVaDSR+a+yirF9AhrihBg6iIsQOOJdypqJXLrLwbBI7Cm6exlpfZVTdmP4YyhUWhYDVhIYdQ5kKxUPsEqQDhv4eESXD1Xv7LUnL7yzLMnTehnawzGX38FXHnv7dIe+21bUfB20O1KMZQxzJwgObEjY1iLJiBjL4Cv6bnnnp2lbGByStjFilxq+5K6a2lz3FwvPX/62fsz8v5PlDDElMahcQAftO8x6Hxp2/JnR/bfijGBTM7wKXXQOkQ7iyxrnSh8yZe1vG0Kqq60R7bQd3pkq5012+luORLOWT+YUEcFGPgljKloUyNi/PStqwMrUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJs4xqLmktERUPH1fU/1HFgWJxjZPs7AGwjEoRQGjgo=;
 b=oYK8DZAZsvVo1PQZzvg2krlR9z8OrxHva1fUTqgn3coztBfSKDBNZvEZ3q7fb6AX+gWyFo6PjP/8bTmhfuV8eN2U4AnvJcIHevRwbgwb53PhZn18ASKVKfhWc1sPJ3rzC+ZKNRvfNCq/nFBpKKCtAllXU3kHOq5q7ng2O6CgNscjcXoxjVNB5Rk41LehGid0zS0gWHWZ0NqMILCd1SAt+uX/XoeEKz2BRUfZ0B9lPSAzj4ohSvnb5uLfqovUCAYygHfBmQ87qM9woEV4Y5Gt9fs1VpRg3x9BK8dD9vWl2NoKCsLN7qGfUKgRuv+3UmIvkenjzmBX3xbVLawLRxupoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJs4xqLmktERUPH1fU/1HFgWJxjZPs7AGwjEoRQGjgo=;
 b=WTacPKXP1RKS/IdQenGEok1jFe7nzKg5HTyobgwy7sM0UjGPQUEwH8BFKL32ldHwxHK9tpmLFgdkpU8g9NeTTXNsTJS0frheqbCZa3G/jMXegKjg9L9+n6viQa85mk552NlywPZlYZ2RMabptHmFEyOYk5OLM7CAQ7WUMxjd5M0=
Received: from DM6PR12MB3996.namprd12.prod.outlook.com (2603:10b6:5:1c1::31)
 by MW4PR12MB5666.namprd12.prod.outlook.com (2603:10b6:303:188::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 15:57:18 +0000
Received: from DM6PR12MB3996.namprd12.prod.outlook.com
 ([fe80::e436:6d53:7445:88b8]) by DM6PR12MB3996.namprd12.prod.outlook.com
 ([fe80::e436:6d53:7445:88b8%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 15:57:18 +0000
From: "Ho, Kenny" <Kenny.Ho@amd.com>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR
Thread-Topic: [PATCH] drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR
Thread-Index: AQHZjyd9xmQrPkt7AE6NNnI82OsITa9y93aAgAAGaViAAAIWgIAAADUt
Date: Tue, 30 May 2023 15:57:18 +0000
Message-ID: <DM6PR12MB39962E6A0AE57849D37AEA6E834B9@DM6PR12MB3996.namprd12.prod.outlook.com>
References: <20230525163827.548058-1-hamza.mahfooz@amd.com>
 <85f47623-5ef1-b817-195b-c4ae39564247@amd.com>
 <DM6PR12MB3996064F09E1C2FD782CC944834B9@DM6PR12MB3996.namprd12.prod.outlook.com>
 <0f2021ba-fab9-3438-950d-7b60882ae77a@amd.com>
In-Reply-To: <0f2021ba-fab9-3438-950d-7b60882ae77a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-30T15:57:17.865Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB3996:EE_|MW4PR12MB5666:EE_
x-ms-office365-filtering-correlation-id: 7fa578f2-2603-42ad-9825-08db61268bb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6xYRI6DRd2yvsts0zrFjU/UcySKy9HO7COQte8gVKFhqsKR9o8moyYbS0Af3kV4pKd0jTrZCc7HxnAaaOX7PJ/xRUPEj9s49f7bjr0RFE8KcxRyW5DU/7RUneoxPSYdOydi/J9IDFoOkVviAuRxqCdplt0FSS7CX2eKMb+ZLlqH7CaPdsa+HbB2qgCuFJWCWbZ2P2PAO61Bl/KtEWU0UvYn4rmzs5ZFFyVD8NqJfUm/69KkObfRKEmEos6732t54T6hcSeT4emodg97ChuOK1VC243y9F1M34/AGD6pAqFuYGj2G9RuvWgS05cdxiQgStThwF/X6pkJFTdhDpMrdXZVJ2A8UB8ePJ8gNivLa+IXM3tC1fqzSrvYbR/aMQqCKTLiw5H091LplV78j+VO+Td3S3obGO87CoPgsHV5VfvAlDwJ7QakI5oKYF00fxLkglRxYppmBMCyf+TuEkpgMUgmVCO+1E7m6fXPax/7rcLKegEeD8lJhV2VNvSnsTR8Iabpz5/x6+NJX7I8zAZMjpWoHrwKRhiejoliKMNAD59uUKrTCw1a3B3CWU6tWVF6GLWyBcEQNXNtDUFJZHTXRe8ON91Yw4k+W6DvlafJOPDa+zysHjUXxmo5+sf2pMmmU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3996.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(451199021)(54906003)(71200400001)(478600001)(110136005)(8676002)(8936002)(5660300002)(52536014)(38070700005)(2906002)(86362001)(33656002)(558084003)(66476007)(66946007)(64756008)(122000001)(76116006)(4326008)(66446008)(66556008)(91956017)(316002)(55016003)(38100700002)(41300700001)(186003)(9686003)(26005)(6506007)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QCnzB/3gp/gbc1AEDhK6Nmms5iE6idLs/B/2iRK5SKS9sJvUNb56RIrY1p?=
 =?iso-8859-1?Q?erWZQtW3lsZB8W1OMGyv0UZrFlyKdNLJI+z3Wl6UN9tHTnRFHzpwNuiAVp?=
 =?iso-8859-1?Q?JtqP91Bg1i7RnNEcwWp2/HlP7Uct35fjfvmPRsAoLzZI5hO9PaFhhwgkC7?=
 =?iso-8859-1?Q?de4jrbTwh0dkxc23H4wFAYWCdeUqgP2052Xv1Rrvv1fc6v6TqKiWXxXev5?=
 =?iso-8859-1?Q?Z8PUT6+GrfpZJ1n+hEFQOxHoaVDa8BC70YQAaTPgrisGHNIVh1lK2Ph0pQ?=
 =?iso-8859-1?Q?6ZsvE4YKug8P0xvSk99spIkpmS5o/nbbcRHEz9J2pNWkIgFdWh1NdqTgpH?=
 =?iso-8859-1?Q?BTpzidsfOwAYDNHSrni5HcthD1VdhyWztOARS0Sp/FSdKksZyRdeU8gxgt?=
 =?iso-8859-1?Q?J2Y2x5mVL5U+aT88rI74bqllJ0H/JQEMfV/Ge6Qc1H2QvViKY/anRvz/UP?=
 =?iso-8859-1?Q?pBovZo0cGdVJk94/wSulI5TMpgFlbv81P61qo/0HLnL1o17/H7co4zIrCg?=
 =?iso-8859-1?Q?WnK3Ien8SabuqEt1lK8K+Y3ws+hStPfO7HNDo8WnKPcr8RtwtoqSSAbOqE?=
 =?iso-8859-1?Q?xaCFogmlEwDta+tvejA2kmeHGWUVkiCdHQllImtyY1ChjZeKT6gKfqP7wf?=
 =?iso-8859-1?Q?rLz8s2O/pxuHekVFYSFfF+Zj4+2Kvy8HvnL38/YUQ57oyS6YFMFAtbdJsR?=
 =?iso-8859-1?Q?UEyRuuldcLO4qO6QfepoX/wrqzkcZcB0XFZuozFjJMzJoNQOdcb/quORAm?=
 =?iso-8859-1?Q?tj6rOiFP7raqlQM+rsx8AVzOLWt6dHrQsEouepn59NAYQ+pLFwp2PrSXyO?=
 =?iso-8859-1?Q?SfJ9vodLuOEIWVuYTX8hfLsqUtGFsbEEqR+cCaJr/gTFdadHocxcbpXoa9?=
 =?iso-8859-1?Q?LVrkroKwoxeVJwrUC+RQVPFqJOwBOeuQJrPGmzfubauh0fyPWyKcOH3NYF?=
 =?iso-8859-1?Q?o+l93D/p27mHZ80idoLkWN0cFrbu6+uJaTpKl8kiXPAPoLQcPv4L70fUi8?=
 =?iso-8859-1?Q?WgsBd9BvMK5p70TgTZ1bG02m5288pIx2gM50g17XDDZpiexxlQvoxDFD47?=
 =?iso-8859-1?Q?n+6y1yGkIIR1+6UeD9dVm27CtKacjQRKilWTHM98hncZ32diZqY+g0Vs3D?=
 =?iso-8859-1?Q?1vNFKpHtbKwDgj2GpNQ/RVEkm2BlaZOqaxyVPlzw+VnPQUeEbU+OUy3mJh?=
 =?iso-8859-1?Q?kwFDwV69+roY8E9mturzT29xzVqXVQqjRDubt0f/tkD1dAmuqrTq183tsz?=
 =?iso-8859-1?Q?qWdrCsW9vK/qz6vIu1ZRCo5HGMpEsO8ENc+Nvbg2CPgtYW+I9VqmFBi01a?=
 =?iso-8859-1?Q?WIQ1lZnFzZS9rjCilRKCu88011aCAyYCb0lAjRnHmAKN2ohAC2x1xr2lC6?=
 =?iso-8859-1?Q?OUOegn0sz83a6tOX4ow/H/r/4BQBLrao9lk5puJJTZ8jaVwAfgwiokYmP7?=
 =?iso-8859-1?Q?EhTMQ3s0CK/gr6nh+aBjY5IpV2qhDTnPIhrUhwvp1E8qvB9uzXkzNWNnRB?=
 =?iso-8859-1?Q?QZP5OC7NeLji10CM4GwOKFmmhdS6IjoM699FVw1UFhD/HFQJAbTxEoN4T2?=
 =?iso-8859-1?Q?203g6+mJwNwvvYKMXKvWSNlpjR+FamRjW0FpM4RFrD31lU0DUA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3996.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa578f2-2603-42ad-9825-08db61268bb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 15:57:18.3875 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lx7zuMQsUmi+xyjuNGtUcWYFRS7Eal7/6lZg/iADX/Ae7C14w0Hb8Hg+9Yv+Lj+e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 =?iso-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>, "Wang,
 Yang\(Kevin\)" <KevinYang.Wang@amd.com>, Peter Foley <pefoley2@pefoley.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Davis <afd@ti.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Ma,
 Le" <Le.Ma@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Li,
 Candice" <Candice.Li@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Reviewed-by: Kenny Ho <Kenny.Ho@amd.com>
