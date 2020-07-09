Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD89C21B0B0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541226EBB8;
	Fri, 10 Jul 2020 07:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CACBB6E9B7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 08:51:55 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9F23CC09CC;
 Thu,  9 Jul 2020 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594284715; bh=htyux7DvBTtATaq8OIlIFXKFfHGdBqSm3UU/TIijJs8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=dUx19oJITDnztw6afFmWaNFRN4xBYpZMQOGAJIfalsnIlozfyzdmKz6Xlx+pEziuu
 1XJcOuFL/gMwgZebpsZUolZ4zglE63zufpau17VFbXESbEqQHbHwWdhWnDfJZY1ANI
 LFhZmIPKrh7C7Rt8W+sT/x6mo5yI5VV2BL2ykgWyV8ZgDdixOWZVH5g/CwBnz1bm1n
 +3F9UAuw+ISCGezfRBnzntB2FATS9zc87dFYpz8WPl5xgsukSetNfrMpsZX589+A0Y
 pSlBt7jI01qZcYEdcl+0FtGqG9qMo0TgVljmveoRTGaKYRdS5Le7lkdNK12g3tmtpC
 i1/oIPfA02I+g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com
 [10.4.161.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 0438AA0067;
 Thu,  9 Jul 2020 08:51:48 +0000 (UTC)
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2051.outbound.protection.outlook.com [104.47.45.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0E439800DF;
 Thu,  9 Jul 2020 08:51:45 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
 spf=pass smtp.mailfrom=angelor@synopsys.com
Authentication-Results: o365relay-in.synopsys.com; dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="u82UdBO3";
 dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvaZ0S0ZNb+hsveDi3N0tLHQb/BoxUMtu+1nm0rsyijaNCciDA4uuTLFYhMePU+7PMlhh+iNgLnSCF3Cu28MSPqdmgLAQga1NWfSRW9sKP1rQe1LUH121JgyWgKFxu+iKd7k1HAGBG/TS3rkiopqMlFXfqPxmsV51lrJ+IludWq4LRS8m92BeG8hmxsbYI+eVkfPnJ0v52glKAmJaINas4Li2hddpeFZcqHjcE7XEraZUE2rfEjd0bM4i7HAsbe3tSL4GM/GRIhjo/EYYR3SnzVAodE+1HcVEXK2LI5p8WCML/DAXpBJiB/qb20HusBkXYANpeBZaje7+wdyDYTpEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mx0IZzSCEEHg5CUclWvF5ydt/W+o+X7VpvsGFDHgTA=;
 b=TKWuTFWZ88SwEQ292XnTrst44cYOVKaxcDllEWBpXES+SSK+OwBmva123so3bYX2Ll90Rz791M7Ca9gwGgsmfSPOQ6+3/8OlBl3fbAXV8hFCIHApIYa2rvVl6JM5ooUMo1Oj7fZeRS64rUseyePa3Fs186JGfMJ/+32Ug9amdDP7wfPWl5nEf9n01mk8AX9cOB2lIFAHib9v4f/J5E/6SQGmZiIl7s92mUaH9yHYgM6kb6/k5cY09AoZSg59S1nmR4bXKw9ak2mwwRFKJ9w/jUmW1YuJwGruhaOqWSjDGXT1Hg29vnEJX399dCs289XJMPqo03bnRx88j5+h19uq3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mx0IZzSCEEHg5CUclWvF5ydt/W+o+X7VpvsGFDHgTA=;
 b=u82UdBO3RvOinUPcJ5+08H8tXKgexFaBBRIxkOK3s59YAxXWQ05/pUASV110VamM3nwW8Fse0T/r69akl3SJSxufnGhHsEU/g4Mgn5bIXVQ47tqtv+U0+cECJ3a917/D0IxAuLzuTdlyF9yBN6y2345mr+DBJuIiKIaYWYNJnxY=
Received: from MN2PR12MB3789.namprd12.prod.outlook.com (2603:10b6:208:16a::20)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 08:51:43 +0000
Received: from MN2PR12MB3789.namprd12.prod.outlook.com
 ([fe80::a452:4793:5e37:e9db]) by MN2PR12MB3789.namprd12.prod.outlook.com
 ([fe80::a452:4793:5e37:e9db%5]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 08:51:43 +0000
X-SNPS-Relay: synopsys.com
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: Philippe CORNU <philippe.cornu@st.com>, Yannick FERTRE
 <yannick.fertre@st.com>, Benjamin GAIGNARD <benjamin.gaignard@st.com>,
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
Thread-Index: AQHWDBo6Hn96DzA7REmPZBpLU636BqjoYdsAgBYY4fCAAPngAIAACRcg
Date: Thu, 9 Jul 2020 08:51:43 +0000
Message-ID: <MN2PR12MB3789022F127910E8A3A00E51CB640@MN2PR12MB3789.namprd12.prod.outlook.com>
References: <a809feb7d7153a92e323416f744f1565e995da01.1586180592.git.angelo.ribeiro@synopsys.com>
 <d46d3aaf-d3cd-e5e1-81b9-c019537bd09a@st.com>
 <CH2PR12MB37823C45C7CC1A142ACC4BBECB670@CH2PR12MB3782.namprd12.prod.outlook.com>
 <8b34476f-61b6-0d28-cf0c-1d6a08df71c8@st.com>
In-Reply-To: <8b34476f-61b6-0d28-cf0c-1d6a08df71c8@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYW5nZWxvclxh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTY3NTJkZjk1LWMxYzEtMTFlYS05ZDdjLWZjNzc3?=
 =?us-ascii?Q?NGVlZGMyZVxhbWUtdGVzdFw2NzUyZGY5Ni1jMWMxLTExZWEtOWQ3Yy1mYzc3?=
 =?us-ascii?Q?NzRlZWRjMmVib2R5LnR4dCIgc3o9IjgwMzciIHQ9IjEzMjM4NzU4MzAwOTQz?=
 =?us-ascii?Q?MTMzNyIgaD0iUk10Slk1WU9KZExJTFhta0Qrb29ERkphQURZPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFB?=
 =?us-ascii?Q?cEgvTXB6bFhXQWM5YzkrOWtVUzFwejF6MzcyUlJMV2tPQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: cd65fca7-d188-4cde-8f1c-08d823e54df0
x-ms-traffictypediagnostic: MN2PR12MB4192:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4192D3EC48FC6E8B1EBFD06FCB640@MN2PR12MB4192.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3TekYIwSpUoT9Q6pqx66d3nU7fKVY7/NPOAKTqIFilY6xlb5jMhsG5/v3nhnYJhs+YlOSR9+O6DF+IJ5NQYkf4QhLBYl5ZH3wZnjaJZEehh1X+aV2Jh99k6H4vZMzx4+0KGG93xCq0wGBu0RZtq6Fu86AJcVrVE2+mciMyqrW5FjDiLV4Pg3i4TmXImSQXX2l148BnvEbZcHiiAB57P5Cryyvp+Yc0La43xpr79ts93iVH5umNV4uNL5lwF8Ct5BcHbwTUfpuhOIhbc37YqtGLj2O4yC/6k1SYwLYk68eoZE5lZldhFJK3Bti+grtegnrml+EFAALfMAKz2c4++t01BKyLzVF0RIAgCupIUBrhYksCQNHtNQcjhgIaY5aLPwLxg0YpZbac2jmHJXq8TPepiG1Hnv+sZAkP5xWdv3FDgzjoM8HIrgI4QjhKhC0gmi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3789.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(396003)(376002)(346002)(39860400002)(136003)(966005)(66946007)(76116006)(5660300002)(54906003)(7696005)(86362001)(110136005)(52536014)(53546011)(6506007)(316002)(66446008)(478600001)(9686003)(83380400001)(8936002)(71200400001)(64756008)(26005)(66556008)(66476007)(55016002)(186003)(107886003)(2906002)(4326008)(7416002)(8676002)(33656002)(921003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: H1JEBqaSV0uuaaJQDl+J1rKVknZsXVzdT+VluBqbDMyPUCzvG3H/ezb46EARnxmjg+IOFfU4faqjh8khOconDkoc3D89JTNzodE08pQjBNROQJqXaCVz91CqnqKftoXlEssWv3tDrSPFbIMgj192MuUvzKn2bnR/aiQcyxtatkdvFrsALPEn1oVuGphRu6swA7Bg0cop3nYm1p/eaToxu99hDgSXKR58KIDLQnB0+xLOXZM3zruOYDxeIRqtdWRUMNUU4cquzODZortBT0RaKXcdDQ/6wEMEeEU05nTB86HCBtn794/tak5EGhzVsziRirdaaxVcsCZHNUJG4DGSECcwqDnBiPSEzNsy2VOaE36IjnmkqXxDFaq1vzcvoWjkGhzXm/30WAn0h3BHcqPm9ZM/ry+n6IhNjAthj60iVBk6ExdYxEfgIIylxajalGe8mwJPftBe6XFZieNAMRu6EYAA9lrNZcPjY3qUd9+Hg9M=
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3789.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd65fca7-d188-4cde-8f1c-08d823e54df0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 08:51:43.3609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/sqTONIIwoPDxl5WiO0/o1tqzVzowqqeVvNBlThWiHd5WA6I+25e4pM0ggxuIH2Plu76G/gkr5wLg30Euvb8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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

Hi Philippe,

From: Philippe CORNU <philippe.cornu@st.com>
Date: Thu, Jul 09, 2020 at 08:56:10

> 
> On 7/8/20 7:08 PM, Angelo Ribeiro wrote:
> > Hi,
> > 
> > Is this patch good to go?
> > @daniel@ffwll.ch, @Philippe CORNU
> > 
> > Was already tested by @Yannick FERTRE
> > and @Adrian Pop
> > on https://urldefense.com/v3/__https://lkml.org/lkml/2020/4/6/691__;!!A4F2R9G_pg!Kt4QZq004dTCJ3GJ6t6RIaJMBrP5tWWgTlboJo1ZICktSxRegGKtp1VxYM1i2PiM$  .
> > 
> > Thanks,
> > Angelo
> > 
> > From: Yannick
> > FERTRE <yannick.fertre@st.com>
> > Date: Wed, Jun 24, 2020 at 16:35:04
> > 
> >> Hello Angelo,
> >> thanks for the patch.
> >> Tested-by: Yannick Fertre <yannick.fertre@st.com>
> >> Tested OK on STM32MP1-DISCO, DSI v1.31
> >>
> >> Best regards
> >>
> >>
> >> On 4/6/20 3:49 PM, Angelo Ribeiro wrote:
> >>> Add support for the video pattern generator (VPG) BER pattern mode and
> >>> configuration in runtime.
> >>>
> >>> This enables using the debugfs interface to manipulate the VPG after
> >>> the pipeline is set.
> >>> Also, enables the usage of the VPG BER pattern.
> >>>
> >>> Changes in v2:
> >>>     - Added VID_MODE_VPG_MODE
> >>>     - Solved incompatible return type on __get and __set
> >>>
> >>> Reported-by: kbuild test robot <lkp@intel.com>
> >>> Reported-by: Adrian Pop <pop.adrian61@gmail.com>
> >>> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> >>> Cc: Joao Pinto <jpinto@synopsys.com>
> >>> Cc: Jose Abreu <jose.abreu@synopsys.com>
> >>> Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
> >>> ---
> >>>    drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 98 ++++++++++++++++++++++++---
> >>>    1 file changed, 90 insertions(+), 8 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >>> index b18351b..9de3645 100644
> >>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >>> @@ -91,6 +91,7 @@
> >>>    #define VID_MODE_TYPE_BURST			0x2
> >>>    #define VID_MODE_TYPE_MASK			0x3
> >>>    #define VID_MODE_VPG_ENABLE		BIT(16)
> >>> +#define VID_MODE_VPG_MODE		BIT(20)
> >>>    #define VID_MODE_VPG_HORIZONTAL		BIT(24)
> >>>    
> >>>    #define DSI_VID_PKT_SIZE		0x3c
> >>> @@ -221,6 +222,21 @@
> >>>    #define PHY_STATUS_TIMEOUT_US		10000
> >>>    #define CMD_PKT_STATUS_TIMEOUT_US	20000
> >>>    
> >>> +#ifdef CONFIG_DEBUG_FS
> >>> +#define VPG_DEFS(name, dsi) \
> >>> +	((void __force *)&((*dsi).vpg_defs.name))
> >>> +
> >>> +#define REGISTER(name, mask, dsi) \
> >>> +	{ #name, VPG_DEFS(name, dsi), mask, dsi }
> >>> +
> >>> +struct debugfs_entries {
> >>> +	const char				*name;
> >>> +	bool					*reg;
> >>> +	u32					mask;
> >>> +	struct dw_mipi_dsi			*dsi;
> >>> +};
> >>> +#endif /* CONFIG_DEBUG_FS */
> >>> +
> >>>    struct dw_mipi_dsi {
> >>>    	struct drm_bridge bridge;
> >>>    	struct mipi_dsi_host dsi_host;
> >>> @@ -238,9 +254,12 @@ struct dw_mipi_dsi {
> >>>    
> >>>    #ifdef CONFIG_DEBUG_FS
> >>>    	struct dentry *debugfs;
> >>> -
> >>> -	bool vpg;
> >>> -	bool vpg_horizontal;
> >>> +	struct debugfs_entries *debugfs_vpg;
> >>> +	struct {
> >>> +		bool vpg;
> >>> +		bool vpg_horizontal;
> >>> +		bool vpg_ber_pattern;
> >>> +	} vpg_defs;
> >>>    #endif /* CONFIG_DEBUG_FS */
> >>>    
> >>>    	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
> >>> @@ -530,9 +549,11 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
> >>>    		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
> >>>    
> >>>    #ifdef CONFIG_DEBUG_FS
> >>> -	if (dsi->vpg) {
> >>> +	if (dsi->vpg_defs.vpg) {
> >>>    		val |= VID_MODE_VPG_ENABLE;
> >>> -		val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
> >>> +		val |= dsi->vpg_defs.vpg_horizontal ?
> >>> +		       VID_MODE_VPG_HORIZONTAL : 0;
> >>> +		val |= dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
> >>>    	}
> >>>    #endif /* CONFIG_DEBUG_FS */
> >>>    
> >>> @@ -961,6 +982,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
> >>>    
> >>>    #ifdef CONFIG_DEBUG_FS
> >>>    
> >>> +int dw_mipi_dsi_debugfs_write(void *data, u64 val)
> >>> +{
> >>> +	struct debugfs_entries *vpg = data;
> >>> +	struct dw_mipi_dsi *dsi;
> >>> +	u32 mode_cfg;
> >>> +
> >>> +	if (!vpg)
> >>> +		return -ENODEV;
> >>> +
> >>> +	dsi = vpg->dsi;
> >>> +
> >>> +	*vpg->reg = (bool)val;
> >>> +
> >>> +	mode_cfg = dsi_read(dsi, DSI_VID_MODE_CFG);
> >>> +
> >>> +	if (*vpg->reg)
> >>> +		mode_cfg |= vpg->mask;
> >>> +	else
> >>> +		mode_cfg &= ~vpg->mask;
> >>> +
> >>> +	dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +int dw_mipi_dsi_debugfs_show(void *data, u64 *val)
> >>> +{
> >>> +	struct debugfs_entries *vpg = data;
> >>> +
> >>> +	if (!vpg)
> >>> +		return -ENODEV;
> >>> +
> >>> +	*val = *vpg->reg;
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>> +DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
> >>> +			 dw_mipi_dsi_debugfs_write, "%llu\n");
> >>> +
> >>> +static void debugfs_create_files(void *data)
> >>> +{
> >>> +	struct dw_mipi_dsi *dsi = data;
> >>> +	struct debugfs_entries debugfs[] = {
> >>> +		REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
> >>> +		REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
> >>> +		REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
> >>> +	};
> >>> +	int i;
> >>> +
> >>> +	dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
> >>> +	if (!dsi->debugfs_vpg)
> >>> +		return;
> >>> +
> >>> +	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
> >>> +
> >>> +	for (i = 0; i < ARRAY_SIZE(debugfs); i++)
> >>> +		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
> >>> +				    dsi->debugfs, &dsi->debugfs_vpg[i],
> >>> +				    &fops_x32);
> >>> +}
> >>> +
> >>>    static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
> >>>    {
> >>>    	dsi->debugfs = debugfs_create_dir(dev_name(dsi->dev), NULL);
> >>> @@ -969,14 +1052,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
> >>>    		return;
> >>>    	}
> >>>    
> >>> -	debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
> >>> -	debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
> >>> -			    &dsi->vpg_horizontal);
> >>> +	debugfs_create_files(dsi);
> 
> Hi Angelo,
> And thank you for your patch.
> Could you please explain why you have "so many lines" for adding the ber 
> pattern, instead of these 4 lines :
> 
> +#define VID_MODE_VPG_MODE		BIT(20)
> +bool vpg_ber_pattern;
> +val |= dsi->vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
> +debugfs_create_bool("vpg_ber_pattern", 0660, dsi->debugfs, 
> &dsi->vpg_ber_pattern);
> 
> Many thanks
> Philippe :-)

Thank you for the review.

With this implementation you only need to set the debugfs file
to control the VPG. Since the internal VPG is used for debug 
purposes it eases the use during your development.

Thanks,
Angelo

> 
> >>>    }
> >>>    
> >>>    static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
> >>>    {
> >>>    	debugfs_remove_recursive(dsi->debugfs);
> >>> +	kfree(dsi->debugfs_vpg);
> >>>    }
> >>>    
> >>>    #else
> >>>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/listinfo/dri-devel__;!!A4F2R9G_pg!PaD758-TpCHJcJG4biB5oM3WJXd1mTbLitD8K1qzSVQ4Z06nc__06MR_sz-ITMIl$
> > 
> > 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://urldefense.com/v3/__https://lists.freedesktop.org/mailman/listinfo/dri-devel__;!!A4F2R9G_pg!Kt4QZq004dTCJ3GJ6t6RIaJMBrP5tWWgTlboJo1ZICktSxRegGKtp1VxYH7H4Xjz$ 


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
