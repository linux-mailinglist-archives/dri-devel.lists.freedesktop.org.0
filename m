Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533B84ECF56
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 00:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C6F10EB47;
	Wed, 30 Mar 2022 22:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FF210E117;
 Wed, 30 Mar 2022 22:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlY3trLd0LV23DPazrUbrhOjlrVl1ipeKaQ2VBondv9nVGthiQJjm7re2IbXJqnQcmj1EHTG/RZ9wgBZ/UG+i/tdsRgm2t/tS68E14+dd+wMc+e3oIWNe7nNw/bgeKvgBn4Yk7JKx77Mog+X7x+mYsWv7uscDCbfI3AB51BJOWnZlG3hY44yKWUppldlDDDh9frUKs+QmbT1BijNfmldnwxDy/TtdqB3gdxlEFzM3j5Zep9scjRSOLyAg9YVjWkLHjMZPNZWvLXEdH9zAi7jUemvRRjrBZh5hB3DKgDAt7c4KBiehIdd8XM2Vdq9M8+wPBUM5BRvr6HzpcrX30mISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2XjJRzVhQxuEVOjggmKXZ++PegsMy3gIjTP39WMh0M=;
 b=iLi8HDOQfOHHwp3iqhXvd/PZDN8bHpaBrOkzdu8FrvUcsvBltw+tI6PX39wkNY9CLZV4NjbPGpzTRpWZMrLkOVffeMDuLYl7TjKLC8vLV0djDAeJYIn7aawRFZLTdsC5wTV2JSwqNzulSWPFg4qtQshJzPFxpd+bZoZyFy99Nb870Iy9V21olbBQV4HhTIHwTKCryy502sDKHZebpJA76yG3eN9deTl1EO9TyyBdj5bsLCijxynGVMrpneyX/NIsZ7CYXbO9KfQkloa25z1xYSypU6ZoBTCNcWXz11OKE6S1c6gsPX9T8tzDIhXPfiXh6G+UdwaTfSzOnOSYSz7iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2XjJRzVhQxuEVOjggmKXZ++PegsMy3gIjTP39WMh0M=;
 b=FqrknANtrryHngE14IFXW2Yuhjw4yhX5z3kRAfFYmjxcsfzIdPT1sAioTGMz9OsBl6wn9m76bgl6NdapwgP5WYMvGy7WIekEwzYiGHTFbx+R8PkpCUimS5s7yWv+Nz71P8YQr6Gen7Ax7FpfLuyzREwmasE6CZTzyJ10bo/sYdc=
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by BYAPR12MB4710.namprd12.prod.outlook.com (2603:10b6:a03:9f::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 22:04:56 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::11cf:fa0:1883:5db5]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::11cf:fa0:1883:5db5%6]) with mapi id 15.20.5102.025; Wed, 30 Mar 2022
 22:04:56 +0000
From: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>
To: Matthew Wilcox <willy@infradead.org>
Subject: RE: [PATCH] drm/amdkfd: Add SVM API support capability bits
Thread-Topic: [PATCH] drm/amdkfd: Add SVM API support capability bits
Thread-Index: AQHYRHyQ/YsZujGeV0SWTSHGpB4J2KzYcWOAgAAJwAA=
Date: Wed, 30 Mar 2022 22:04:56 +0000
Message-ID: <SN6PR12MB27176C9B277885712B12B428FD1F9@SN6PR12MB2717.namprd12.prod.outlook.com>
References: <20220330212420.12003-1-alex.sierra@amd.com>
 <YkTLoQNBEOlkJ1tV@casper.infradead.org>
In-Reply-To: <YkTLoQNBEOlkJ1tV@casper.infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 822d6017-d27b-4331-b612-08da12995393
x-ms-traffictypediagnostic: BYAPR12MB4710:EE_
x-microsoft-antispam-prvs: <BYAPR12MB471069A9CBD34AE605025766FD1F9@BYAPR12MB4710.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XCrMxpY8Es/RfCO3jpxXpnFVUZDlPNhurc6xDy95NIFL6bahlEuvtQ08Ar0zPF4B7vMO9MUQM8d2I4iNTCsfxu22OtzBPD4g4rGSsWXrPuO+bwmMPVbvdF+cYzaaPY+rp3utCfzImkFGs3TwFdoc8DTGqSNkZAGxPreKwgy/ApwHrNMOduiEyig5EI2pdhsH+9QtWbcGeJlwVPwLEeJnkxSl9VBadvA5KvOijGZJ66izmTuzVtxVe5qK3b8cB/QsbGV4GY3wU9sUqDoZkszsuZFbkr+mfEnuMbqhB4VLATXLQZunoRU6wgcalCncO6bK6BT1baxd8DqwdMOB80pLyWVvggqiDLbWXS7PAKIls7lhtN21x/ORCn4JT889lXsSLZruBa6ICr7pWDfZNgyGwtnR4UEMZ9CttQJkK1VbBKptjim30n+/aYcVm6tcQETIFSyjpJxAyhVQd3jL8H7XGgK33u9xwUI9dInOTiO6W4V3yDqMgymhipOGcGMIfhRCkbb3DlCVV15Y+eCR10pZVMAk1g2crDzMSNvFAYOoHw9/yP952BYeiMpWdcQUtw77lJ0kyJLBUXWJmCN5h36Po5mrvenx/M5c+MXf7ASySiM5CGwXKZfIZsa2vt/ksVHtSkO0vc1dhQ4U0TXISsLQwh4Lj5jVS5HJFKmz2FO8aL0KSv6jYAbPpbfE4bAFOxJvlbt8I9Yfji/dobRCX1vQoA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(6506007)(9686003)(53546011)(7696005)(38100700002)(508600001)(83380400001)(6916009)(55016003)(316002)(186003)(2906002)(52536014)(33656002)(4326008)(54906003)(7416002)(122000001)(5660300002)(66946007)(71200400001)(66446008)(86362001)(66476007)(66556008)(64756008)(38070700005)(76116006)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qPZzwP3SS7O0cTv31RWtyf8jNwkIi+D2YfPikBFHY6+MHXk6JpU4+BBUmNez?=
 =?us-ascii?Q?ayV0O94f0o2rGHwRCeLe5HxrsJ5FSd8tw2vU0qvwk1qo8Zl8iQEFKJD3F4LX?=
 =?us-ascii?Q?NnyStaRhVuVnJaghBHy0kEsrJFl9ZRRSIVBrxcGCNZeT5oDRK2eprMkcd0qi?=
 =?us-ascii?Q?K58HnjvXajicHTRf3oF8+/AzmSxOCpsDkHdiwT3uYQPc5bITDcHhz51kot9X?=
 =?us-ascii?Q?V35NPcryDF3PF/X3GTBrdEsLzRvavaYYXXbeA6Q7uTKEn7mbSt7ygNgbfcYD?=
 =?us-ascii?Q?bchz/3RT32dSSZh+U/GsZgai7COExQ6+CCpJW352Z66+VEiQhA5/nwez2ood?=
 =?us-ascii?Q?jp64Un7UA/2yK7jo4DqnChFt7prnbHv79EvqlbkK6B8Q8FUQq55ZwbA3/c2f?=
 =?us-ascii?Q?ui3l6w3EJD8y7y4dhMUNz5UokEBUaSf+P9tVK9BiI9886Uf8YxtTItIZToO0?=
 =?us-ascii?Q?EffoiEt6sYBP/rEgnTwAwciU71GHaJEIYTw4fxrz1/Waz9+MekwtzWztHmyb?=
 =?us-ascii?Q?lS4tI+W01cJaY+U3WHuwI8a6B38U7oLtySgptThRmi0NGPpakiK1RdeQ8jRX?=
 =?us-ascii?Q?GymCr4t8X+ywOQO1iEFlWV628uAEtnCBYDYh5ghmyTcA2tTSMkv5UY11cpng?=
 =?us-ascii?Q?fHFS4x2+bGkqiF22pm4XQlKwY8LrFBcGFKj9AqxT5fpIJCet4BiZGLoyZiuN?=
 =?us-ascii?Q?Me+vvJHWh4BsysKoAvxpiWHYnMTUFNJaUfXctf21mtMZS+JJQDKCTojkJN4c?=
 =?us-ascii?Q?CN1oyn4d6NTcrWAMJVbio/sny7wgwKcXnK7gjVokl1EoHqFUr1HMZ+VE5xDr?=
 =?us-ascii?Q?D7PbR7jHN546z9lF2pUsaBbk5TgO9jED7JcvuDitsbk97gKv2ivNwdV9zebA?=
 =?us-ascii?Q?fhiSRgxudCktIpktJmKQJOcIaFndTmMK5eLOSEFhgyN31+BllODZdBFv3nmN?=
 =?us-ascii?Q?X0/QXjSHHXDAjY9iMlWYGBFflszqwAjnTknnFZO7PIBHIHy9z+wHoPhXgB2l?=
 =?us-ascii?Q?Sx6o4ctCdgf8ljFGlkJbnBofi28W7Aex9kHiy1J1JTtnrVQqDxTx/R3Y7uJn?=
 =?us-ascii?Q?W+jMXTNMFPFrEawQ+JJ+la/Lhb5W7qT3hpDcDAOQ4vD5NnK1fVZtXchErIQP?=
 =?us-ascii?Q?eSYAHjJEwHLdkE1cJ8fUQISrdb2bxQ/eMzneH2ynRlUWBGvIm8aOTK80ZjfM?=
 =?us-ascii?Q?fLZh+RtphiVwNHtC9bZkQ4z0EOKhKQsO9pR8NjEPyNfZBTT5syEfQ89UnW0q?=
 =?us-ascii?Q?fLZbtbnwKSPKzblE4oKOYqd4k92bNa4EJOH0cUVGZUjoZcbgo5fsbMWYJ7xY?=
 =?us-ascii?Q?PGbaNQKxh4xnFa/la0Dl6oKvrN6L/2WsekyKxlTxoX6jQBvs9t+cjoAc/aq5?=
 =?us-ascii?Q?HcccPhDQUuunCi2NRC/OMFaSk+aTeiQcyVeALbbOGVmYdK3hc9gMFLGqbQTc?=
 =?us-ascii?Q?n70GeW3QK9lslFX8717T/LjypIcYxG+JHqfkT8eyAuifJIxvANkO88lAwRb/?=
 =?us-ascii?Q?zAHr6sb1TwGj6hMJKZNS89yTJyN7QSNNpUM6aX4siRMaDPcU5GFdyCth3iLo?=
 =?us-ascii?Q?/NXv6LpFBSHMfTEJ9+b46DQj9WmN7oARu2IUN/s+iUZeQjiS4I48SiX+aScA?=
 =?us-ascii?Q?8wUS4SLDgHNoU9F75zgZT8uPF+N5mFjTErNX4PxWlLQkvozaL/BGZUlB0ICA?=
 =?us-ascii?Q?ijh7uPsNEiXXavfm2uifKlzDoNDmy2sR2SEFh7iGDyAUcUZR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822d6017-d27b-4331-b612-08da12995393
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2022 22:04:56.7050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k82t44jqmK1JqT0ZclA/kNdHqOJE7I75fCwvjbk3XkjEWjjLlXWDX9vBqTtwwGbEB+L1WjtK9ZghEwQc3mLQ5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB4710
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
Cc: "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "david@redhat.com" <david@redhat.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "apopple@nvidia.com" <apopple@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew,
I sent this patch by accident. Please ignore it.

Regards,
Alex Sierra

> -----Original Message-----
> From: Matthew Wilcox <willy@infradead.org>
> Sent: Wednesday, March 30, 2022 4:29 PM
> To: Sierra Guiza, Alejandro (Alex) <Alex.Sierra@amd.com>
> Cc: jgg@nvidia.com; david@redhat.com; Kuehling, Felix
> <Felix.Kuehling@amd.com>; linux-mm@kvack.org; rcampbell@nvidia.com;
> linux-ext4@vger.kernel.org; linux-xfs@vger.kernel.org; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; hch@lst.de;
> jglisse@redhat.com; apopple@nvidia.com; akpm@linux-foundation.org
> Subject: Re: [PATCH] drm/amdkfd: Add SVM API support capability bits
>=20
> On Wed, Mar 30, 2022 at 04:24:20PM -0500, Alex Sierra wrote:
> > From: Philip Yang <Philip.Yang@amd.com>
> >
> > SVMAPISupported property added to HSA_CAPABILITY, the value match
> > HSA_CAPABILITY defined in Thunk spec:
> >
> > SVMAPISupported: it will not be supported on older kernels that don't
> > have HMM or on systems with GFXv8 or older GPUs without support for
> > 48-bit virtual addresses.
> >
> > CoherentHostAccess property added to HSA_MEMORYPROPERTY, the
> value
> > match HSA_MEMORYPROPERTY defined in Thunk spec:
> >
> > CoherentHostAccess: whether or not device memory can be coherently
> > accessed by the host CPU.
>=20
> Could you translate this commit message into English?  Reviewing
> Documentation/process/5.Posting.rst might be helpful.
