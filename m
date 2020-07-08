Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C35C321991E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7966E9C8;
	Thu,  9 Jul 2020 07:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE3426E58A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:08:23 +0000 (UTC)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7B03140AF7;
 Wed,  8 Jul 2020 17:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594228103; bh=2jEvUb/uTFJGecJdugPOPZBDNEPd/fiCzGzHFMxWB1U=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=l1wbF1mW3JxiLkko0svM2+QyiPtf/iWrcoiLcIWj3XrwZK8f19rQz3MNaoHwqQ2Na
 ysCcqff81MphicqTrm67Iv0IkPAXWsJWBexhTjjtGd7nUFaZ1OgiEifb3aPS+F/qOe
 aE84pV5hXzM3Z/JO6WOtYo6b4RAWJp7G2YJMYqsuyVh6M3g8W1Xes7rQA0oYLKdL2B
 Kn5KQwHhnsZGNW/zU69InGDnkUAnqbQfAXAFWMWBS8yzhvhVO3ftoYFQELKp1B2Gdb
 3+7B2jeyIKnyW8k20UCWbDqsOdFsxJPsC8vrWHvagd/+NaXFUYeEjyycBALmlxD3QL
 ohPXuLrcjR4sg==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com
 [10.202.1.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6B2E5A005C;
 Wed,  8 Jul 2020 17:08:19 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2058.outbound.protection.outlook.com [104.47.36.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id BDD7240140;
 Wed,  8 Jul 2020 17:08:16 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=angelor@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="EYkG2YsQ";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHuurGmbRntmiX/zUPOMYqpf9BgzX10QwfJ7IMCSzuHv28Zofpox2h/5vAtldp4C55wEzqG7dUTnWB7E+TVkhbUHjAgGF43fbamfyyANxCihKX3vJj3J9VFBdOngbsVBsu3Z+hgiiDuQ+Jvx0AZmg/VKOtKsFI6Cds9Jb9G27gLuwZaW7VFOrSRBytkPQpqIl7TYwnXQnbqZFDE93tOKj8bGeyPFcDJba22DoT/Yu+mfwjEaX8SOdeVc2ST8b0pQiggIdILxkrAprdC0vVBTsaPBibszwZjBwZvtFYW3t5a5ASyxaJ31OAmd/eSrJGCOIidOnp8AhdhE+3EDuYtMfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ/Pi8xqWX8QEndtEFm6veBXsMoKztFNzftj3gLGHSM=;
 b=jKSCnK+8Qsns04SOd5LznCpKnjT97IwyEltYPsrun522OLchX2uIgp5a/B1nNrrMenFCY+8DXQ2j+fEg85e5cQruZqpEEMmpgc83ww9xh2+CTaduUtM3ddWO5Nn/SQknFq8tIoQpv/ArOSWddNg80NGaMsfgg8ib7kXURsdsjgRJPSUrORqOIKp42HOpxlcc6YbJ3gWkw+ObB45XGKZbFR1eGtCp/3bzSSqcZLR0Xo7uoEjuvGidAIuqxDc7Z2P/Be805SwatogHTlwDzglzORJPgZ5c4CAme/km/aaSnCxeYfIPKpkOegpJluvplpjydbWPizZW/hfrGSLT67c9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ/Pi8xqWX8QEndtEFm6veBXsMoKztFNzftj3gLGHSM=;
 b=EYkG2YsQuXNluyDC+wrThmDDfFfMD53pGWLadIk0QHJrX2I1AZ0v56KxkUkW4NPsQ5bELEiZij0vWzhv8X9F0HTZLhzN+vfKkt+cJ3mJjyGyKsAW99eawrvb8/thA/yeFaUb4P8S97FcFqkK5pcEiTOLFsDRURiY8dAiZiNHrXI=
Received: from CH2PR12MB3782.namprd12.prod.outlook.com (2603:10b6:610:23::28)
 by CH2PR12MB3704.namprd12.prod.outlook.com (2603:10b6:610:21::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 17:08:15 +0000
Received: from CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::cd2:acb3:1b6a:236d]) by CH2PR12MB3782.namprd12.prod.outlook.com
 ([fe80::cd2:acb3:1b6a:236d%7]) with mapi id 15.20.3153.029; Wed, 8 Jul 2020
 17:08:14 +0000
X-SNPS-Relay: synopsys.com
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Philippe CORNU
 <philippe.cornu@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "pop.adrian61@gmail.com"
 <pop.adrian61@gmail.com>
Subject: RE: [PATCH v2] drm/bridge: dw-mipi-dsi.c: Add VPG runtime config
 through debugfs
Thread-Topic: [PATCH v2] drm/bridge: dw-mipi-dsi.c: Add VPG runtime config
 through debugfs
Thread-Index: AQHWDBo6Hn96DzA7REmPZBpLU636BqjoYdsAgBYY4fA=
Date: Wed, 8 Jul 2020 17:08:14 +0000
Message-ID: <CH2PR12MB37823C45C7CC1A142ACC4BBECB670@CH2PR12MB3782.namprd12.prod.outlook.com>
References: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
 <d46d3aaf-d3cd-e5e1-81b9-c019537bd09a@st.com>
In-Reply-To: <d46d3aaf-d3cd-e5e1-81b9-c019537bd09a@st.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: yannick.fertre@st.com, philippe.cornu@st.com, daniel@ffwll.ch,
 pop.adrian61@gmail.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYW5nZWxvclxh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTk5ZDExZGU0LWMxM2QtMTFlYS05ZDdjLWZjNzc3?=
 =?us-ascii?Q?NGVlZGMyZVxhbWUtdGVzdFw5OWQxMWRlNS1jMTNkLTExZWEtOWQ3Yy1mYzc3?=
 =?us-ascii?Q?NzRlZWRjMmVib2R5LnR4dCIgc3o9IjYzNDkiIHQ9IjEzMjM4NzAxNjkxNjEy?=
 =?us-ascii?Q?NTY2OCIgaD0iTllWU1FNN0ZyQUwxNkxZZVgvZVd1aDFqa1RBPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFE?=
 =?us-ascii?Q?a3h5aGNTbFhXQVUxamo4SzRlTWZYVFdPUHdyaDR4OWNPQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQ2tDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFIYVd5TkFBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QmhB?=
 =?us-ascii?Q?RzBBY3dCMUFHNEFad0JmQUhJQVpRQnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUcwQWFRQmpBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFITUFkQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZEFC?=
 =?us-ascii?Q?ekFHMEFZd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhr?=
 =?us-ascii?Q?QVh3QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QjFBRzBBWXdBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQVp3QjBBSE1BWHdCd0FISUFid0JrQUhVQVl3QjBBRjhB?=
 =?us-ascii?Q?ZEFCeUFHRUFhUUJ1QUdrQWJnQm5BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCaEFHTUFZd0J2QUhVQWJnQjBBRjhBY0FCc0FHRUFi?=
 =?us-ascii?Q?Z0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFZUUJzQUdVQWN3QmZB?=
 =?us-ascii?Q?SEVBZFFCdkFIUUFaUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBTVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QnpBRzRBY0FCekFGOEFiQUJwQUdNQVpRQnVBSE1BWlFCZkFIUUFaUUJ5QUcw?=
 =?us-ascii?Q?QVh3QnpBSFFBZFFCa0FHVUFiZ0IwQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhZQVp3QmZBR3NBWlFC?=
 =?us-ascii?Q?NUFIY0Fid0J5QUdRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFBPSIvPjwvbWV0YT4=3D?=
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [95.136.124.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 199feca2-fe27-41dc-6fc0-08d8236180a1
x-ms-traffictypediagnostic: CH2PR12MB3704:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3704ECD9FC7FBC2A6D7FB83FCB670@CH2PR12MB3704.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QaVMVdofiO20MBHt0IgQl5z994ktpXdoSrAlvg3YZ+oAI2aB5BFihAjvD/alPqJSReTe6KPy/WkL/CqZaTQ8bPMYvD8KDWjq0Hxyx90C+hjbUC93Gbm3Q1cxjR41iCgTUNWYn5t5mFz1+sMAhkJGxeOpJsBKsOb4EziiD+nBZCDTNp+aOqlvMTlzmVMSTSsk0tHszBUtm0vbPs9UwQ9ImQX575g77QRH+AxdgbSvseIH4NHMiz1uwxY2bHyyNr2RIz78C9jWXzC0dsnRd9KlvV4MniVO/xosVsEBvmZlKwJGfqlV7DpEv3L/wJiPr7rbsEY0JA3nJHzM84Ko+hfdVrgRSz2Ih3TsdjCV+ByMcERXDwx5nIOATa0ZYESCXp8oYTkTQSW1vFnXwLeI/o/cfqlYUzwyMPRACSabd535B39JDC76IcWgSCVP/+LG4bDq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(366004)(136003)(396003)(346002)(39860400002)(86362001)(66556008)(478600001)(8676002)(110136005)(5660300002)(186003)(26005)(9686003)(966005)(52536014)(7416002)(4326008)(33656002)(107886003)(2906002)(53546011)(6506007)(55016002)(83380400001)(71200400001)(316002)(54906003)(7696005)(66476007)(64756008)(66446008)(76116006)(8936002)(66946007)(921003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: CM/UkheSuG89QXdY4GMNJFGr9D3Cw3cmPG1tB4bVN7ms+SOuqQ+Hpcn0X2fFqzQMRYW15h79grcXsZijF0Nvnwp0aXjQQyULOPT2kaJv3x09C0BFWO5OzLkS+X8GBzKB8Gwlxsx7m3ZBKfiSnFIdj/6tKbQRYdyo60i4iewZ7N25WBx2MrOOdcuIBC82lZu9o6m/Gwc4/a3hc5bg0gsd9UzuaXa0cfL3qfHdn5yr6GxpP50pCz6hDE122FvhJqlU01Wx1+18BoJ/mGvEdtZlMd0H/CFXQJLn8DbTa1O7D7X5dYq+eQypdf/A672a56jDlL2uU8+GunBUh1zAKkA1MIBVJ4F4VNn3HC1+uBEYjypKRSwgxPK94horiocNaIUlVitAUT7h9rKaeuEbqzicnIT9u+OJLAmjGO00sNNIsKUnVCBHrflg71FfRUcnCaJwcXxwQOAJqhJC0nuJg+Je0sVUxKxMuWiFkF838KjzWQk=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199feca2-fe27-41dc-6fc0-08d8236180a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2020 17:08:14.8219 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJm9jGwWQ4qlPZVnTWEtk8Qz0fVviKWyqYP/zfL5v8NOWV9cdSCQKXo820neDhFeiT6G9TolmPR4FL0p2ppFNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3704
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Is this patch good to go? 
@daniel@ffwll.ch, @Philippe CORNU

Was already tested by @Yannick FERTRE 
and @Adrian Pop
on https://lkml.org/lkml/2020/4/6/691 .

Thanks,
Angelo

From: Yannick 
FERTRE <yannick.fertre@st.com>
Date: Wed, Jun 24, 2020 at 16:35:04

> Hello Angelo,
> thanks for the patch.
> Tested-by: Yannick Fertre <yannick.fertre@st.com>
> Tested OK on STM32MP1-DISCO, DSI v1.31
> 
> Best regards
> 
> 
> On 4/6/20 3:49 PM, Angelo Ribeiro wrote:
> > Add support for the video pattern generator (VPG) BER pattern mode and
> > configuration in runtime.
> > 
> > This enables using the debugfs interface to manipulate the VPG after
> > the pipeline is set.
> > Also, enables the usage of the VPG BER pattern.
> > 
> > Changes in v2:
> >    - Added VID_MODE_VPG_MODE
> >    - Solved incompatible return type on __get and __set
> > 
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Reported-by: Adrian Pop <pop.adrian61@gmail.com>
> > Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> > Cc: Joao Pinto <jpinto@synopsys.com>
> > Cc: Jose Abreu <jose.abreu@synopsys.com>
> > Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> > ---
> >   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 98 ++++++++++++++++++++++++---
> >   1 file changed, 90 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > index b18351b..9de3645 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> > @@ -91,6 +91,7 @@
> >   #define VID_MODE_TYPE_BURST			0x2
> >   #define VID_MODE_TYPE_MASK			0x3
> >   #define VID_MODE_VPG_ENABLE		BIT(16)
> > +#define VID_MODE_VPG_MODE		BIT(20)
> >   #define VID_MODE_VPG_HORIZONTAL		BIT(24)
> >   
> >   #define DSI_VID_PKT_SIZE		0x3c
> > @@ -221,6 +222,21 @@
> >   #define PHY_STATUS_TIMEOUT_US		10000
> >   #define CMD_PKT_STATUS_TIMEOUT_US	20000
> >   
> > +#ifdef CONFIG_DEBUG_FS
> > +#define VPG_DEFS(name, dsi) \
> > +	((void __force *)&((*dsi).vpg_defs.name))
> > +
> > +#define REGISTER(name, mask, dsi) \
> > +	{ #name, VPG_DEFS(name, dsi), mask, dsi }
> > +
> > +struct debugfs_entries {
> > +	const char				*name;
> > +	bool					*reg;
> > +	u32					mask;
> > +	struct dw_mipi_dsi			*dsi;
> > +};
> > +#endif /* CONFIG_DEBUG_FS */
> > +
> >   struct dw_mipi_dsi {
> >   	struct drm_bridge bridge;
> >   	struct mipi_dsi_host dsi_host;
> > @@ -238,9 +254,12 @@ struct dw_mipi_dsi {
> >   
> >   #ifdef CONFIG_DEBUG_FS
> >   	struct dentry *debugfs;
> > -
> > -	bool vpg;
> > -	bool vpg_horizontal;
> > +	struct debugfs_entries *debugfs_vpg;
> > +	struct {
> > +		bool vpg;
> > +		bool vpg_horizontal;
> > +		bool vpg_ber_pattern;
> > +	} vpg_defs;
> >   #endif /* CONFIG_DEBUG_FS */
> >   
> >   	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
> > @@ -530,9 +549,11 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
> >   		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
> >   
> >   #ifdef CONFIG_DEBUG_FS
> > -	if (dsi->vpg) {
> > +	if (dsi->vpg_defs.vpg) {
> >   		val |= VID_MODE_VPG_ENABLE;
> > -		val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
> > +		val |= dsi->vpg_defs.vpg_horizontal ?
> > +		       VID_MODE_VPG_HORIZONTAL : 0;
> > +		val |= dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
> >   	}
> >   #endif /* CONFIG_DEBUG_FS */
> >   
> > @@ -961,6 +982,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
> >   
> >   #ifdef CONFIG_DEBUG_FS
> >   
> > +int dw_mipi_dsi_debugfs_write(void *data, u64 val)
> > +{
> > +	struct debugfs_entries *vpg = data;
> > +	struct dw_mipi_dsi *dsi;
> > +	u32 mode_cfg;
> > +
> > +	if (!vpg)
> > +		return -ENODEV;
> > +
> > +	dsi = vpg->dsi;
> > +
> > +	*vpg->reg = (bool)val;
> > +
> > +	mode_cfg = dsi_read(dsi, DSI_VID_MODE_CFG);
> > +
> > +	if (*vpg->reg)
> > +		mode_cfg |= vpg->mask;
> > +	else
> > +		mode_cfg &= ~vpg->mask;
> > +
> > +	dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
> > +
> > +	return 0;
> > +}
> > +
> > +int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
> > +{
> > +	struct debugfs_entries *vpg = data;
> > +
> > +	if (!vpg)
> > +		return -ENODEV;
> > +
> > +	*val = *vpg->reg;
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
> > +			 dw_mipi_dsi_debugfs_write, "%llu\n");
> > +
> > +static void debugfs_create_files(void *data)
> > +{
> > +	struct dw_mipi_dsi *dsi = data;
> > +	struct debugfs_entries debugfs[] = {
> > +		REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
> > +		REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
> > +		REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
> > +	};
> > +	int i;
> > +
> > +	dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
> > +	if (!dsi->debugfs_vpg)
> > +		return;
> > +
> > +	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
> > +
> > +	for (i = 0; i < ARRAY_SIZE(debugfs); i++)
> > +		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
> > +				    dsi->debugfs, &dsi->debugfs_vpg[i],
> > +				    &fops_x32);
> > +}
> > +
> >   static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
> >   {
> >   	dsi->debugfs = debugfs_create_dir(dev_name(dsi->dev), NULL);
> > @@ -969,14 +1052,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
> >   		return;
> >   	}
> >   
> > -	debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
> > -	debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
> > -			    &dsi->vpg_horizontal);
> > +	debugfs_create_files(dsi);
> >   }
> >   
> >   static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
> >   {
> >   	debugfs_remove_recursive(dsi->debugfs);
> > +	kfree(dsi->debugfs_vpg);
> >   }
> >   
> >   #else
> > 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/listinfo/dri-devel__;!!A4F2R9G_pg!PaD758-TpCHJcJG4biB5oM3WJXd1mTbLitD8K1qzSVQ4Z06nc__06MR_sz-ITMIl$ 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
