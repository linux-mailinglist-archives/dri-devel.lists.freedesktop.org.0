Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8538869E75B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 19:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A59F10E021;
	Tue, 21 Feb 2023 18:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307210E021;
 Tue, 21 Feb 2023 18:21:21 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31LGhoKv002617; Tue, 21 Feb 2023 18:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=uwA6GH6jYC9ZIEfWzhctuobvAQ+loiWvANmvv8lguqI=;
 b=FIPtEPd75btsVTpL1yts0sALgqAQgWGQ21jwzWQhFG2saKrbLxYjs1kuvFgcjDB2KLXl
 7qlqtNLwBN15wQNUrVwmylzdiDhyTIpPUjLV1VPskNLKwSsqtpb64Vg0p8JH9jecHniG
 4HCuMDn1wuWKKWEo/ZfbDs1g3R6G+wT9a7ToAcavwZLjiUy5j9XGM3DjxqF4+MU11A35
 4r5+UplKYBSrvvxpjkYgUuiFa3WWM1XlXeGegccjdDfUY+l6biLREzKlsvmlQnr5NAYL
 XjljOFJSHsdj4ygx4cw1Jt15HMNiuNDy3DX34hxhSA4H+TeQcsKjh4yfmT9I0vLWMWXI Eg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntp9tny88-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Feb 2023 18:20:58 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31LI9hfH013067; Tue, 21 Feb 2023 18:20:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4csw3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Feb 2023 18:20:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axWa2LCtKa1XDTqlDDUvKqBr+HuTTSw9cAGZkBWWg3Q80eZFaHoHmK8NbX1s5HqkoiSNEuz9h7NU2fM3FHwuy/iEbaWIjMZdOiVuftoWv7dOtd863NAi8Vj8JToaBnCz1zT6lsQjHEN1ax8GNQVdKJ96HmzQr1fy/wtN+XLs9hQdhcWWGtuXiOfvKUfo3T11Qexj0pdBmRaQhkCIT+Y4LwAYZK/dpNO9+Ovl+7keae//eLL5wSwHUy8FmZDhEuReacwkivZdQ8g8jE88lzHVptiV3zUV/VACf8/jMzdmE8GR3gkSUPtAVC3S3Q6Yawm8GZlQyLpHDulFTVcV9hzcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uwA6GH6jYC9ZIEfWzhctuobvAQ+loiWvANmvv8lguqI=;
 b=XmQywvCXjRKinBgI/JLeonIMk1a5mfqaD+HWAm6LjrLYw0rPOSx2v+AIipgri/+wW6r/1zmlFarNBfMVlrA2t7PVyNyliEKJ/GIj0+VqrNMCTOPybR/kLb4/ciNLoCsnamLe+DrS3qXa8Keya73yKOhFZIYYVZUe9deVNbaVLtFszCmkmjJMlKkG4wxLeXUP/Y7I2Z29ZIsWgvu53znaFO/m08zbfZmWyCjfi08EK4ie7NX5TGjKCoNoyTQ/GRh2Fu4OaHg9qJ8CZojPBhcCGoT8YbkvjT83tBxa6NZ/XGwT6f9rHVrmOq441w91FxjPIZ1QkeWsIjWLWh5Hh+9fdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwA6GH6jYC9ZIEfWzhctuobvAQ+loiWvANmvv8lguqI=;
 b=ESR8DSezolZMVYdXFVbMzfXN34ppj/VpgOXV+X3o4FYVjcT7M9i2JPkttRplsyEuRXloKP+rdakHlsXOobdATbZ0Oflm6ENlMjManmk5A5StDZJTfNtAn+3qskIYHBpkgnsfFqusnyZVaDcYQvM6xAtz/MXUn63XTPgGTxzupeA=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by DS7PR10MB4864.namprd10.prod.outlook.com (2603:10b6:5:3a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.16; Tue, 21 Feb
 2023 18:20:54 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::93c9:c99e:5ab:4319%7]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 18:20:54 +0000
Date: Tue, 21 Feb 2023 13:20:50 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 05/16] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230221182050.day6z5ge2e3dxerv@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
 Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
 corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
 matthew.brost@intel.com, boris.brezillon@collabora.com,
 alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
 willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-6-dakr@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217134422.14116-6-dakr@redhat.com>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT4P288CA0060.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::20) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|DS7PR10MB4864:EE_
X-MS-Office365-Filtering-Correlation-Id: faeb1020-0cd1-411c-715f-08db14385ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +z0u4CwzOvAddXz02afBt9zJeocwyxLDdKJ4wpQG7ZgLtES4DnoBHr2hyQq5rGKZgJiQFCwuMUFNajTXVG5wza0Dee3tGwUnHWikIm/Xbu9tvQWUwyQ8Zzba3VXryZY4mlMN+oUgWIOvdAWAGUCGCVW2Jrsaquo3TgCOBvroOXetwYyOdgNOcuNWWbKBwvyLTZaFKDE2sIWuhabPO313LVvrXJ9IkLLTR20SQN1ynpj+x+yIkft03nm1TEof/LN/ee6G/yT3TnsX8sgGgXEi4fTwwcxIeZvLNc3pXssihSEnvomH6P4ZMN3xCgF10MaUceDzg22vtu698ffqq3uDZK5HTP49CcujMMz8O70YWkaNPZHkFdg3Kin+/OIjnDnrldTkkibgI0XT8tyN11ncbIIZLBXDigwvJhen66LGAFRvOKddeGKTUHmtXnLd7l4gFcgb+Tv5Pp91wSqzbjbV8td6GuuKkdfKQLdZsYnJLPMtPYP5c23zZfFhkkDH35QbhsGAkPCUivPA/vHoa4OBJXkDxZN9Z6tQvJoimutRUrOP/JDmwbme1nlsXj3+qguINyqA3NuX7wnsvajmWUXzyzdpVGi60nrs7Tm3++Jr/YtwsC+vrIPPAeouC3+hNN/F7edONEPXtbokgaNSvXqcFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB3022.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199018)(66556008)(66476007)(66946007)(6916009)(8676002)(316002)(41300700001)(4326008)(5660300002)(86362001)(83380400001)(6666004)(6512007)(6506007)(9686003)(186003)(6486002)(26005)(1076003)(2906002)(33716001)(38100700002)(478600001)(8936002)(7416002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BP+cchQWb8CN0WB/Yk2T0/Ia5aojwtPA9jjNbIrGDc5/OlvwwU60fkBhbrit?=
 =?us-ascii?Q?4qmKM0hjNbKwHOAfVnD2DgoWL3kudiZX75QiWcad6sX69Wzz5BFc1USYlJ2b?=
 =?us-ascii?Q?NoUBpYnTG/0oQPc3L0pvwTQfKym4D0bKsTp4WROsZpVXUBYvN3oMzhLPhXnY?=
 =?us-ascii?Q?XCbifZajZlKgV3n7l8EsWpYwiN9IybE4mpTEPED/OTvj389tDXbk4V9YxCCA?=
 =?us-ascii?Q?txTuVDB/JG9ezsk6TgTmQ9NK3qMyopw5OSTu0laQBW6rpxthqL8MjockUN9V?=
 =?us-ascii?Q?FB/dh33KhVqtVq7HU4GBbL3VPfuzqpvYtiWBhQ+YfCIBPPvuzM0yykDevR3R?=
 =?us-ascii?Q?dbQijqVoCOIq8geBArKbVGONq+vpWKSrSbvM7qraJ9ID7r7RAxz44ahDLx6I?=
 =?us-ascii?Q?zXvm1TBf7AkTWAIFGHfr/GFWYivWNIBLMjvfGyM9zuvQjDkeSRH4WSzyyKDJ?=
 =?us-ascii?Q?xzhtFtNh6wkajHIx3iK/ssLx1oprI/yvHQOwg/vVfhdGWTOeHN+JWcXdCPTM?=
 =?us-ascii?Q?OOFbIEhzDAPaIatFaTBeLXvgxED9R5SmXaxcOwZFlZtOzR6iYRgbF5oESdLd?=
 =?us-ascii?Q?K7ZaPjZ9ccTID25jUieZHq5Y6VkgDUlSyhSwknKNrt3tTFKoyBDYnmpU8zq+?=
 =?us-ascii?Q?/1dalfTVAU4oR7D5PgT7pvAhDM5L5ovCPszv9ilkEl0YA9RP0Y00CbSwrssF?=
 =?us-ascii?Q?i/KdILn6lA1VfuhaknS3+ufqogKucgMngnyj5L6dG8LPooMU/L6sC5OtiH1q?=
 =?us-ascii?Q?vM2TW0NMiK8N2y2gUv09zPhYm21HqHrwlDme/laePSVRiDO9J6/Dy0ruErTq?=
 =?us-ascii?Q?yXoowcYzEeHRSk2eOltFZ1ZXR/4AY+fLratbTLZTdUXKKm/P6bDyJq9oniMN?=
 =?us-ascii?Q?bMraHVhvpcIvRUL88L7Pmk3L07dpIYv/aA0PeIuYJEMGuaK01ETMVJitvsP2?=
 =?us-ascii?Q?u+mGdgqzXx2aKWREhH+bmTKPGYahCerZ2J5ropKH4tSCVwWny2Uuigh0fuTS?=
 =?us-ascii?Q?g0A9lCEkiXp806larxNsHuI7Av2x+JLRkMEwWQXxlZfOJLj9cJHeFp7xnE6t?=
 =?us-ascii?Q?cWHQx3wWzZUT3bup11lOmwdU/WwEXSWwWdLIWUbGiLST9Thmgeu7tF1av8I9?=
 =?us-ascii?Q?MQEYzs3UTY/JWiyNSLXQzTmfoeeSIbHcdzFIIKF0NF/1SFAtoDvXlZtqqYek?=
 =?us-ascii?Q?7M6DNwRAuCpJFp3m4inBZwANq5XiIAkYeq3bwUsqzfP+kI/o47DI52IFH4PQ?=
 =?us-ascii?Q?Yn7njApog2ydpHoNLydtny4fH/zijBZF7HmY6P0Tl734DROd5Hj0ZRJ55U/+?=
 =?us-ascii?Q?wOnk1OhxIWoaCaDBPTmwpztliuzRJivT+ssbNDQqq6ZlvzbBAh0dJPlp1yK8?=
 =?us-ascii?Q?GiO5+fnWzrKTB85nJY/dcB+XJJyA6Yn+GIZr2p7Fg/hM5lkuOb3O+wxk5q3H?=
 =?us-ascii?Q?NR3ewX4nAaB7488YdtscEPa/QorkMbEbcF8/fdJWKcAjIMyWEr6XZ3zrPOWO?=
 =?us-ascii?Q?+IWLE15IFkFr2cd6/cRkEJrEdZz/r+/wqchaT40R14FkcFWYXgBGiGdhJZQ7?=
 =?us-ascii?Q?jWtnfyMDQGrYJ1Qcep97mCZfzm0+SD5KoKVPih1Pgyb04uKROw48nNxu4mWL?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?H161NM7gfd5IXXAMiRZbOStrqY0UgIZPRe1fBpNns/Q5a44JUGWY32rR+y3K?=
 =?us-ascii?Q?qI7Mqif5d2glWBKd9pOG8E8DfZVHk+oKFdYHnpHsvFtAT38UnkTDjdGZskJk?=
 =?us-ascii?Q?+XO1a1VECB1qXS9SkVq2wu/TM2rpQRo3l2Uvd/HaB8gIDGBX6NUYwCjB75yc?=
 =?us-ascii?Q?BLd/VbfLGaq5HyvMEvrmfWnlc11okaKmD3lDJeuKT0Q0PV7c2F1zSNAgAUwJ?=
 =?us-ascii?Q?ue2tVpRSikEWZRlg1yLwSJ68Z7gbit67YEnQFokrXX6ArZ3pbrId8pAtUPnv?=
 =?us-ascii?Q?kzltkyd745LwaB3yvcwpBlrcg8K8G5i9XaACCo09tSp2QuLF2VUkmYc7GXiN?=
 =?us-ascii?Q?SQ72DPL6Tp2i0MMDXWxy4yATrz8aQOBbbekQZRcsgz999ur1EZWogn6R2Huk?=
 =?us-ascii?Q?hIvPltzLAY1TK0Z709qPQl8Ijndfs/D+gHLo7uqmw23r9WZR9TmeLdG0UtYj?=
 =?us-ascii?Q?m/cnN3NbiUxltOO2oPfaQXAujRCIpU+E1uKt+Zx7xifSIAyuT4vEn4PcGmKY?=
 =?us-ascii?Q?1RwLYShpB2cA0c+IGg8ElI7NIqE1qtQ98NFutjQf5gy60qcnSCJp//oFTZKm?=
 =?us-ascii?Q?n+L9Dm/XSztWsSwIzwWEfxQqvuppGimscubuskq7NFzjHPYAFWWWCXI4vZ0G?=
 =?us-ascii?Q?EOVQdDwt3kv+RH4QDRAq2pS7hxkOPoSTafPB5t2usehw5BrKvLJ3Fj4ddbcB?=
 =?us-ascii?Q?uO2rnW4jRQ+qkVFOrsYNBFsfFruZflN4sCUK4V3JNrISPdLvuBUTpxCO0XEZ?=
 =?us-ascii?Q?VrN/kad99RdGUbTczZxZKI7HWlXeHGISwVTUTa9yp7IsGI0UPODJ2X/Ze4Sq?=
 =?us-ascii?Q?6uletkDsFqa4wGmwGyBGGP+c09YZ3gAYSFZWmtp7F0GfqzM+epRJh4FswM8W?=
 =?us-ascii?Q?yiwkfaYYT9BiI+N3EehetwayP/lVcchHzwm+Ic0z96HP/ar8URgd4SEGvDI1?=
 =?us-ascii?Q?9Dufkpfb0B0fluuJFIVmN8amWvFOMumtXeEatIkB1adxZJ8pq8aIFCcrKT69?=
 =?us-ascii?Q?Ad900k4xvHEiZvcG42bF2EvffzU/ydUu/F8PdsfAxgNJ370P3wBwr6n2tCQb?=
 =?us-ascii?Q?WfdghGn7pKndi8nZzPDj3mIgO8Puv+CSGQkNG5lcxylOSrva4TdmlUuLl5yM?=
 =?us-ascii?Q?Wg/B2t1EdvUltHb89WEeRqY+/RkV+YbvQA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faeb1020-0cd1-411c-715f-08db14385ea4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 18:20:54.4428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrOAvLrK5kfYP3uZ70RtUJvlQaZ0KPodVb8o+qQDIwP3dS+Dgrd0Urzg8ndheaUc5Ky49s/ci9FluPOOqqx3Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4864
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_11,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302210155
X-Proofpoint-GUID: 4MS8vrvZl8HCLTljDLcXjpHhJ0xsTmLn
X-Proofpoint-ORIG-GUID: 4MS8vrvZl8HCLTljDLcXjpHhJ0xsTmLn
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Dave Airlie <airlied@redhat.com>, bagasdotme@gmail.com,
 christian.koenig@amd.com, jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Danilo Krummrich <dakr@redhat.com> [230217 08:45]:
> Add infrastructure to keep track of GPU virtual address (VA) mappings
> with a decicated VA space manager implementation.
> 
> New UAPIs, motivated by Vulkan sparse memory bindings graphics drivers
> start implementing, allow userspace applications to request multiple and
> arbitrary GPU VA mappings of buffer objects. The DRM GPU VA manager is
> intended to serve the following purposes in this context.
> 
> 1) Provide infrastructure to track GPU VA allocations and mappings,
>    making use of the maple_tree.
> 
> 2) Generically connect GPU VA mappings to their backing buffers, in
>    particular DRM GEM objects.
> 
> 3) Provide a common implementation to perform more complex mapping
>    operations on the GPU VA space. In particular splitting and merging
>    of GPU VA mappings, e.g. for intersecting mapping requests or partial
>    unmap requests.
> 
> Suggested-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  Documentation/gpu/drm-mm.rst    |   31 +
>  drivers/gpu/drm/Makefile        |    1 +
>  drivers/gpu/drm/drm_gem.c       |    3 +
>  drivers/gpu/drm/drm_gpuva_mgr.c | 1704 +++++++++++++++++++++++++++++++
>  include/drm/drm_drv.h           |    6 +
>  include/drm/drm_gem.h           |   75 ++
>  include/drm/drm_gpuva_mgr.h     |  714 +++++++++++++
>  7 files changed, 2534 insertions(+)
>  create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
>  create mode 100644 include/drm/drm_gpuva_mgr.h
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index a52e6f4117d6..c9f120cfe730 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -466,6 +466,37 @@ DRM MM Range Allocator Function References
>  .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>     :export:
>  
...

> +
> +/**
> + * drm_gpuva_remove_iter - removes the iterators current element
> + * @it: the &drm_gpuva_iterator
> + *
> + * This removes the element the iterator currently points to.
> + */
> +void
> +drm_gpuva_iter_remove(struct drm_gpuva_iterator *it)
> +{
> +	mas_erase(&it->mas);
> +}
> +EXPORT_SYMBOL(drm_gpuva_iter_remove);
> +
> +/**
> + * drm_gpuva_insert - insert a &drm_gpuva
> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> + * @va: the &drm_gpuva to insert
> + * @addr: the start address of the GPU VA
> + * @range: the range of the GPU VA
> + *
> + * Insert a &drm_gpuva with a given address and range into a
> + * &drm_gpuva_manager.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_insert(struct drm_gpuva_manager *mgr,
> +		 struct drm_gpuva *va)
> +{
> +	u64 addr = va->va.addr;
> +	u64 range = va->va.range;
> +	MA_STATE(mas, &mgr->va_mt, addr, addr + range - 1);
> +	struct drm_gpuva_region *reg = NULL;
> +	int ret;
> +
> +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
> +		return -EINVAL;
> +
> +	if (unlikely(drm_gpuva_in_kernel_region(mgr, addr, range)))
> +		return -EINVAL;
> +
> +	if (mgr->flags & DRM_GPUVA_MANAGER_REGIONS) {
> +		reg = drm_gpuva_in_region(mgr, addr, range);
> +		if (unlikely(!reg))
> +			return -EINVAL;
> +	}
> +

-----

> +	if (unlikely(drm_gpuva_find_first(mgr, addr, range)))
> +		return -EEXIST;
> +
> +	ret = mas_store_gfp(&mas, va, GFP_KERNEL);

mas_walk() will set the internal maple state to the limits to what it
finds.  So, instead of an iterator, you can use the walk function and
ensure there is a large enough area in the existing NULL:

/*
 * Nothing at addr, mas now points to the location where the store would
 * happen
 */
if (mas_walk(&mas))
	return -EEXIST;

/* The NULL entry ends at mas.last, make sure there is room */
if (mas.last < (addr + range - 1))
	return -EEXIST;

/* Limit the store size to the correct end address, and store */
 mas.last = addr + range - 1;
 ret = mas_store_gfp(&mas, va, GFP_KERNEL);

> +	if (unlikely(ret))
> +		return ret;
> +
> +	va->mgr = mgr;
> +	va->region = reg;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gpuva_insert);
> +
> +/**
> + * drm_gpuva_remove - remove a &drm_gpuva
> + * @va: the &drm_gpuva to remove
> + *
> + * This removes the given &va from the underlaying tree.
> + */
> +void
> +drm_gpuva_remove(struct drm_gpuva *va)
> +{
> +	MA_STATE(mas, &va->mgr->va_mt, va->va.addr, 0);
> +
> +	mas_erase(&mas);
> +}
> +EXPORT_SYMBOL(drm_gpuva_remove);
> +
...

> +/**
> + * drm_gpuva_find_first - find the first &drm_gpuva in the given range
> + * @mgr: the &drm_gpuva_manager to search in
> + * @addr: the &drm_gpuvas address
> + * @range: the &drm_gpuvas range
> + *
> + * Returns: the first &drm_gpuva within the given range
> + */
> +struct drm_gpuva *
> +drm_gpuva_find_first(struct drm_gpuva_manager *mgr,
> +		     u64 addr, u64 range)
> +{
> +	MA_STATE(mas, &mgr->va_mt, addr, 0);
> +
> +	return mas_find(&mas, addr + range - 1);
> +}
> +EXPORT_SYMBOL(drm_gpuva_find_first);
> +
> +/**
> + * drm_gpuva_find - find a &drm_gpuva
> + * @mgr: the &drm_gpuva_manager to search in
> + * @addr: the &drm_gpuvas address
> + * @range: the &drm_gpuvas range
> + *
> + * Returns: the &drm_gpuva at a given &addr and with a given &range

Note that mas_find() will continue upwards in the address space if there
isn't anything at @addr.  This means that &drm_gpuva may not be at
&addr.  If you want to check just at &addr, use mas_walk().

> + */
> +struct drm_gpuva *
> +drm_gpuva_find(struct drm_gpuva_manager *mgr,
> +	       u64 addr, u64 range)
> +{
> +	struct drm_gpuva *va;
> +
> +	va = drm_gpuva_find_first(mgr, addr, range);
> +	if (!va)
> +		goto out;
> +
> +	if (va->va.range != range)
> +		goto out;
> +
> +	return va;
> +
> +out:
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_gpuva_find);
> +
> +/**
> + * drm_gpuva_find_prev - find the &drm_gpuva before the given address
> + * @mgr: the &drm_gpuva_manager to search in
> + * @start: the given GPU VA's start address
> + *
> + * Find the adjacent &drm_gpuva before the GPU VA with given &start address.
> + *
> + * Note that if there is any free space between the GPU VA mappings no mapping
> + * is returned.
> + *
> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> + */
> +struct drm_gpuva *
> +drm_gpuva_find_prev(struct drm_gpuva_manager *mgr, u64 start)

find_prev() usually continues beyond 1 less than the address.  I found
this name confusing.  You may as well use mas_walk(), it would be
faster.

> +{
> +	MA_STATE(mas, &mgr->va_mt, start, 0);
> +
> +	if (start <= mgr->mm_start ||
> +	    start > (mgr->mm_start + mgr->mm_range))
> +		return NULL;
> +
> +	return mas_prev(&mas, start - 1);
> +}
> +EXPORT_SYMBOL(drm_gpuva_find_prev);
> +
> +/**
> + * drm_gpuva_find_next - find the &drm_gpuva after the given address
> + * @mgr: the &drm_gpuva_manager to search in
> + * @end: the given GPU VA's end address
> + *
> + * Find the adjacent &drm_gpuva after the GPU VA with given &end address.
> + *
> + * Note that if there is any free space between the GPU VA mappings no mapping
> + * is returned.
> + *
> + * Returns: a pointer to the found &drm_gpuva or NULL if none was found
> + */
> +struct drm_gpuva *
> +drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end)

This name is also a bit confusing for the same reason.  Again, it seems
worth just walking to end here.

> +{
> +	MA_STATE(mas, &mgr->va_mt, end - 1, 0);
> +
> +	if (end < mgr->mm_start ||
> +	    end >= (mgr->mm_start + mgr->mm_range))
> +		return NULL;
> +
> +	return mas_next(&mas, end);
> +}
> +EXPORT_SYMBOL(drm_gpuva_find_next);
> +
> +static int
> +__drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
> +			  struct drm_gpuva_region *reg)
> +{
> +	u64 addr = reg->va.addr;
> +	u64 range = reg->va.range;
> +	MA_STATE(mas, &mgr->region_mt, addr, addr + range - 1);
> +	int ret;
> +
> +	if (unlikely(!drm_gpuva_in_mm_range(mgr, addr, range)))
> +		return -EINVAL;
> +
> +	ret = mas_store_gfp(&mas, reg, GFP_KERNEL);
> +	if (unlikely(ret))
> +		return ret;
> +
> +	reg->mgr = mgr;
> +
> +	return 0;
> +}
> +
> +/**
> + * drm_gpuva_region_insert - insert a &drm_gpuva_region
> + * @mgr: the &drm_gpuva_manager to insert the &drm_gpuva in
> + * @reg: the &drm_gpuva_region to insert
> + * @addr: the start address of the GPU VA
> + * @range: the range of the GPU VA
> + *
> + * Insert a &drm_gpuva_region with a given address and range into a
> + * &drm_gpuva_manager.
> + *
> + * Returns: 0 on success, negative error code on failure.
> + */
> +int
> +drm_gpuva_region_insert(struct drm_gpuva_manager *mgr,
> +			struct drm_gpuva_region *reg)
> +{
> +	if (unlikely(!(mgr->flags & DRM_GPUVA_MANAGER_REGIONS)))
> +		return -EINVAL;
> +
> +	return __drm_gpuva_region_insert(mgr, reg);
> +}
> +EXPORT_SYMBOL(drm_gpuva_region_insert);
> +
> +static void
> +__drm_gpuva_region_remove(struct drm_gpuva_region *reg)
> +{
> +	struct drm_gpuva_manager *mgr = reg->mgr;
> +	MA_STATE(mas, &mgr->region_mt, reg->va.addr, 0);
> +
> +	mas_erase(&mas);
> +}
> +
> +/**
> + * drm_gpuva_region_remove - remove a &drm_gpuva_region
> + * @reg: the &drm_gpuva to remove
> + *
> + * This removes the given &reg from the underlaying tree.
> + */
> +void
> +drm_gpuva_region_remove(struct drm_gpuva_region *reg)
> +{
> +	struct drm_gpuva_manager *mgr = reg->mgr;
> +
> +	if (unlikely(!(mgr->flags & DRM_GPUVA_MANAGER_REGIONS)))
> +		return;
> +
> +	if (unlikely(reg == &mgr->kernel_alloc_region)) {
> +		WARN(1, "Can't destroy kernel reserved region.\n");
> +		return;
> +	}
> +
> +	if (unlikely(!drm_gpuva_region_empty(reg)))
> +		WARN(1, "GPU VA region should be empty on destroy.\n");
> +
> +	__drm_gpuva_region_remove(reg);
> +}
> +EXPORT_SYMBOL(drm_gpuva_region_remove);
> +
> +/**
> + * drm_gpuva_region_empty - indicate whether a &drm_gpuva_region is empty
> + * @reg: the &drm_gpuva to destroy
> + *
> + * Returns: true if the &drm_gpuva_region is empty, false otherwise
> + */
> +bool
> +drm_gpuva_region_empty(struct drm_gpuva_region *reg)
> +{
> +	DRM_GPUVA_ITER(it, reg->mgr);
> +
> +	drm_gpuva_iter_for_each_range(it, reg->va.addr,
> +				      reg->va.addr +
> +				      reg->va.range)
> +		return false;
> +
> +	return true;
> +}
> +EXPORT_SYMBOL(drm_gpuva_region_empty);
> +
> +/**
> + * drm_gpuva_region_find_first - find the first &drm_gpuva_region in the given
> + * range
> + * @mgr: the &drm_gpuva_manager to search in
> + * @addr: the &drm_gpuva_regions address
> + * @range: the &drm_gpuva_regions range
> + *
> + * Returns: the first &drm_gpuva_region within the given range
> + */
> +struct drm_gpuva_region *
> +drm_gpuva_region_find_first(struct drm_gpuva_manager *mgr,
> +			    u64 addr, u64 range)
> +{
> +	MA_STATE(mas, &mgr->region_mt, addr, 0);
> +
> +	return mas_find(&mas, addr + range - 1);
> +}
> +EXPORT_SYMBOL(drm_gpuva_region_find_first);
> +
> +/**
> + * drm_gpuva_region_find - find a &drm_gpuva_region
> + * @mgr: the &drm_gpuva_manager to search in
> + * @addr: the &drm_gpuva_regions address
> + * @range: the &drm_gpuva_regions range
> + *
> + * Returns: the &drm_gpuva_region at a given &addr and with a given &range

again, I'm not sure you want to find first or walk here.. It sounds like
you want exactly addr to addr + range VMA?

> + */
> +struct drm_gpuva_region *
> +drm_gpuva_region_find(struct drm_gpuva_manager *mgr,
> +		      u64 addr, u64 range)
> +{
> +	struct drm_gpuva_region *reg;
> +
> +	reg = drm_gpuva_region_find_first(mgr, addr, range);
> +	if (!reg)
> +		goto out;
> +
> +	if (reg->va.range != range)
> +		goto out;
> +
> +	return reg;
> +
> +out:
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_gpuva_region_find);
> +

...

