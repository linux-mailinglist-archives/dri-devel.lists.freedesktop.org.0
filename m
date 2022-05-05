Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 288BE51CC56
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1618A10FB03;
	Thu,  5 May 2022 22:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB45310FB03;
 Thu,  5 May 2022 22:50:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isLFgay7CkbquwKKmH8xjrnYXQ3MaQXifpD/3zw3xBtAK0kMHjzDKDvMjY00dKS2s4s1wDaSGW9MHkS7yceXD329m8334ktW68HCY5LtqZyg7bP2gXL8J/DKbAVP+wMMOB3egFExPhMwouhlWnWvezSHPiEv9fZIB2SgD/kWEH2qsIqaqh+o0dFmOrfthiFVVZE+42j4nZllRVfE+iculwPCCqpKygXLjHPDkB7RrQDSw5tZ654N1/m8U6Og7/OCsH3D3Clt/WUXceeYQ+JopWmgMCNyRpkIR4Sm8xtZn9RH2fsUJa0XGRz/fzBMURugjGLSTAbQq0aRe0qHscsC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWHveaucWAMrlWiJbBp4VwJh/N/deTTy/Te2lM5AwGk=;
 b=Vh04sVyHN/dwvit8ZrkqdksDJ8cARIC7e2DgymTO58WzYBAtAnR6vwWpQNyc793a8LX8K6O2PnICCmlQDinPq/xBnbvr9ERnsiBSHJlCdG8h9pyeqBJcrkpPr61wkYhamH5wLHLjA7hrhgA0P8n8a1ipEVyvOLIhTSMFJZuGItZXdyRg7aetKxLCkLmdcfloRDRrkb5bgBlJJzsCyNALqD3SOAJeJzjpt7VMcB5WcPpjT81Lf2GsH8jS/al40rvupLM4GnFsyZYGdmAbjqCCLScVLnB9rSCKz5rDtALjMv7/7jO1snxd2pGVggJqGRyQROA03HftcjaifwEDUaNY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWHveaucWAMrlWiJbBp4VwJh/N/deTTy/Te2lM5AwGk=;
 b=sHsckKYdZM/Qe3CAlFP6fXtSofoPyxIJauLY+LKquUdX/bRGCR14bxypCJjck8S1V46x6p3ZMEXoLJWg8ObUjRN/ttR784tofymNWnfxrtqycp3751WKlplJLq4WfdSz0f4TOdff3WqE2K1+XUsJZblqpsJ1Yy54jbnBzyFaFWSAtrjWHDi+bZLQmKAX/+mvfIh9DWdbfKZ/ZOzizbZlty1hN6R9RJXIIUsVlmnz1NU5DDrAyjFgtlwz12MKtOaFF2GNUPCRMwCf/3txhkv/AiSLMpMr95BePju71yi4dzNr/xgNvP3bDkiUuNGGWdac/FmF/woJLD7jXMqzbxeVig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by MW2PR12MB2459.namprd12.prod.outlook.com (2603:10b6:907:c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 22:50:19 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::2d17:b68a:e101:4c18]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::2d17:b68a:e101:4c18%6]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 22:50:19 +0000
From: Alistair Popple <apopple@nvidia.com>
To: "Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com>
Subject: Re: [PATCH v1 04/15] mm: add device coherent checker to remove
 migration pte
Date: Fri, 06 May 2022 08:48:37 +1000
References: <20220505213438.25064-1-alex.sierra@amd.com>
 <20220505213438.25064-5-alex.sierra@amd.com>
 <SN6PR12MB27173F2F37294D6DDBC3457CFDC29@SN6PR12MB2717.namprd12.prod.outlook.com>
User-agent: mu4e 1.6.9; emacs 27.1
In-reply-to: <SN6PR12MB27173F2F37294D6DDBC3457CFDC29@SN6PR12MB2717.namprd12.prod.outlook.com>
Message-ID: <87zgjvh9w5.fsf@nvdebian.thelocal>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd80132e-8136-4330-b563-08da2ee9a138
X-MS-TrafficTypeDiagnostic: MW2PR12MB2459:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB245982CE131E860C7626850FDFC29@MW2PR12MB2459.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irnaT/bclar4rF0r+SspE4Q6qYLH+fYQ3eML4GKQ0brUQ6w5VUeimIiM0XCNmQII9aLW52gz9NU4I+jCALfx+xaH10EhSdOhGbIDSCk87mz+5l2jxtD8aA6r2VqaPR2ZFeGnI7pwnnxVpltRUNQFf0pz3gc5LmOgrvQGdG0PLB6WcpLOrTZ5oQe2FGrjettK2/5ZpcnFB4E/rvUMCqjigmwmFXf1893dAgxqc4o8eOOpjl3+LF/6pxVX9Sj5lqjW7UcJKZtHj/jLIoEPa7Iyp3eqrPSmA1SfKk36lxVrCzHq0RrKnZfs3Wk/7rZ8exurNR/tuc2ytWU1Q0f/MrHZrjKQapuMPKKLrinHd3aaF3SbsMvSuESNYHFDPdaajX17BM7b6VLKOWLQwV3ra5VnSgCbMz2v/e4cy2COXLvQhnj+ehPPj1t8cTnrrsv17lnOI6PowyZXKjyV8FCzESqLYjm3ZSCLE39ZyI7740YPAUC5HZ4ZJ1g10E3+VRZuBsj77aIvnIU62BB5Oh7ZqtZo6YXiUy5vDdb1GW0hXhhf7nObHw529KOc0ZqG2kYt29wArvO3/lNnG7Dek82OgVlL0/Dmcr3W1V0y6mbJvVf2STRsibq26LIr/T/lz5jpx/o7PUazF8LsgVXSn5qQCdMYAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(186003)(38100700002)(83380400001)(54906003)(6512007)(66476007)(8676002)(4326008)(66556008)(6916009)(316002)(6666004)(66946007)(2906002)(7416002)(8936002)(5660300002)(6486002)(9686003)(508600001)(53546011)(26005)(44144004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AsxTcloKkS+2MGtYP3sZ4MkVHXq37p3awq2Os2tj2NFrZcO3BsHQZC81BqY0?=
 =?us-ascii?Q?4J5kJw9fMgWishEYM42tVq50h0/dUrDR+EnzNprQ0g4Kq0h391S8S8gi3rW/?=
 =?us-ascii?Q?p/4aBwQ1QhZfXhon+v6FHenXRQyZjpwnQyf9CLlYeWasKvEsQi820vzugsuZ?=
 =?us-ascii?Q?CeDBwR7HKlpPz3+DyiwtijBR29kPSb9f2Us1Smxf1T/7BmgBVeGv7lJFM2Ou?=
 =?us-ascii?Q?5U8o4M0icMnilia2wR8IY3q+iVrGdEzAIppuR33HMyRESC6I9HfOn9udwYWt?=
 =?us-ascii?Q?6UgHrjT5t8eWTIgtUs7uEiTninPODXxddcJJZNOCO36oRYdWDPSJff8ZSCJE?=
 =?us-ascii?Q?iWCLPfmOJO8ubx2LVbUaOZeJXTFU3Ko11gCkqKKnON9rdf5aiiAb/0OwVLpT?=
 =?us-ascii?Q?S3EXd4449gpDwdJD1QWUDxHYqvLNSPOELHJhK3Dhtp92gjMPxPLSIOHCZRug?=
 =?us-ascii?Q?wR2/XbYyR5pqYPRoeil8QbFwhABKokx86Duaf3Pi1VkOGrh6m6RR6nzberVR?=
 =?us-ascii?Q?LIB7HZgovu2W+JEW9e2hP5tp/ViSNmW2CErf0sG2M/aOgpe9GrV3oTratpoz?=
 =?us-ascii?Q?BzRUzgBRsQH2egzPyfM2VexL4Fxj5owILLiQw1kKmPovDq7PaSRZdYvanmT4?=
 =?us-ascii?Q?UiYnwhWvI6qN/0CcTaA7t16z6IATBZqETgxJKHsKMtAOk1to8ARjWSppjizL?=
 =?us-ascii?Q?xVcs9BhvFpii3nV9OFvdPww6iXU4qqb2tiMT8zEBFs+LZ8HOoLujy6IRHC8H?=
 =?us-ascii?Q?h/QIR6yXwsr65WF1Uu3nQi0RRpNQpdbpczxfbVhooI/McVuIvVtVfOGlBMu5?=
 =?us-ascii?Q?pq+6NvaGV4RBTmpZpId7mWjnex2b29j7ip6Dk0m9cnPhUY5wneNNhA+qQ6Re?=
 =?us-ascii?Q?O6w0dK3rII/O5X98n75NLy7HBK/3GV6xP8uYy/Rrl0ipvDA7nkYs/tBxXcFg?=
 =?us-ascii?Q?1WZfKJJK0aihXPR/rQd2G83RRr/XcpQKECOkqelZqmGc42RV5QVAszVbFRH7?=
 =?us-ascii?Q?VDbxcgWwIceH5sJhRubPnlyOfsaKjJZseZmbTRY1PebGmaNxDTZMIAWF7Fz7?=
 =?us-ascii?Q?YUYBSROHTFrquTDP06HLP/HJ4kw5Who+m61wKsuQTmPPe3CuEa4vLiZ+zYfR?=
 =?us-ascii?Q?WFRjnVBx2pX2b2ePxnbZDkmCrdX6SWxOC8Kay7B9x6pkOg77nnjTu14/o4oA?=
 =?us-ascii?Q?Y7Zg7ChNOJw2GFP/0d6hSfFxDOW6awUAS1rmKDZM7dCYWGMnvpOeC+L/pKDh?=
 =?us-ascii?Q?buy4Xj22t0oOwsqcYyFWaI1CIHp3sj9pQkCi3MloPNT6K018pjbC1FKX1lne?=
 =?us-ascii?Q?10aQcws44UtUaclVIzLPks3XWFAvkftvSJujoM95qCwrRCGm/crjSq6cpflH?=
 =?us-ascii?Q?msk50n5dI9GIOERmHDB8TJqZMdwlwJNswp0b4FDPqmI/GNGPqLkktaYAxKUL?=
 =?us-ascii?Q?RDsvf7ncNP3WqyIOWaGU8JZ1GsMWXD2um+2lF/FKaMphEFsig0JSSpmkx7WZ?=
 =?us-ascii?Q?DVOmNtX0wfgmQ7rgW2qGoTdFSx+dlvMI4GjOg4rMwH3RBykVzgP2ZZmqkyVs?=
 =?us-ascii?Q?G3kbx67KudyL3NLIjtS5xrMVANR/apUJuWbcS7RZX2KEfWPXQrp0PsnR73EC?=
 =?us-ascii?Q?KqhVEWLqKlzdCPWYBN0v3+iW9D7h/VrldCfhfd91aaqC0N2x87Cu5Kt6GJii?=
 =?us-ascii?Q?5cXYmQoNZVW5U0Iifn9OMEZaoERZ5bJyUCC6+4epFW0HbTu0at1f7/FPRdEu?=
 =?us-ascii?Q?QMoaO9jRdA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd80132e-8136-4330-b563-08da2ee9a138
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 22:50:19.5639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mmshOUfxy0qU8KMplvQYEQC19YcgJfMQElm6WKavlrHaGd9kEJjpivLDOsunRCJqUty3oMT+cD5oMRaDVHg1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2459
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "david@redhat.com" <david@redhat.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "willy@infradead.org" <willy@infradead.org>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain
Content-Disposition: inline

"Sierra Guiza, Alejandro (Alex)" <Alex.Sierra@amd.com> writes:

> @apopple@nvidia.com Could you please check this patch? It's somehow related to
> migrate_device_page() for long term device coherent pages.

Sure thing. This whole series is in my queue of things to review once I make it home from LSF/MM.

- Alistair

> Regards,
> Alex Sierra
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex
>> Sierra
>> Sent: Thursday, May 5, 2022 4:34 PM
>> To: jgg@nvidia.com
>> Cc: rcampbell@nvidia.com; willy@infradead.org; david@redhat.com;
>> Kuehling, Felix <Felix.Kuehling@amd.com>; apopple@nvidia.com; amd-
>> gfx@lists.freedesktop.org; linux-xfs@vger.kernel.org; linux-mm@kvack.org;
>> jglisse@redhat.com; dri-devel@lists.freedesktop.org; akpm@linux-
>> foundation.org; linux-ext4@vger.kernel.org; hch@lst.de
>> Subject: [PATCH v1 04/15] mm: add device coherent checker to remove
>> migration pte
>>
>> During remove_migration_pte(), entries for device coherent type pages that
>> were not created through special migration ptes, ignore _PAGE_RW flag. This
>> path can be found at migrate_device_page(), where valid vma is not
>> required. In this case, migrate_vma_collect_pmd() is not called and special
>> migration ptes are not set.
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>>  mm/migrate.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/migrate.c b/mm/migrate.c index
>> 6c31ee1e1c9b..e18ddee56f37 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -206,7 +206,8 @@ static bool remove_migration_pte(struct folio *folio,
>>  		 * Recheck VMA as permissions can change since migration
>> started
>>  		 */
>>  		entry = pte_to_swp_entry(*pvmw.pte);
>> -		if (is_writable_migration_entry(entry))
>> +		if (is_writable_migration_entry(entry) ||
>> +		    is_device_coherent_page(pfn_to_page(pvmw.pfn)))
>>  			pte = maybe_mkwrite(pte, vma);
>>  		else if (pte_swp_uffd_wp(*pvmw.pte))
>>  			pte = pte_mkuffd_wp(pte);
>> --
>> 2.32.0

--=-=-=--
