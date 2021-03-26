Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7513434AE49
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 19:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986FA6F466;
	Fri, 26 Mar 2021 18:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449226F466;
 Fri, 26 Mar 2021 18:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnkkTCnGqISofmUuLPHWjT1HuJunarrGXqMNPjvC07PbcMd/28STbBbEpPpre9erADLNcJo6/TeOnHgcwM283CLOioKjnowanjOOoN6TGjyg3hPQItgC5H42ZB7dpXhItYHn6xyu+ZkQLBo1o0B7VDn3k+9Cy7PWylgEMJP6Dw43PjdDz41/oqltKRyRMjVjhm1jIMYXPB8gyaOTo4SBVSbwuZnTOisyffjXc47UkCvIqi4AVY6rwRYOqyB3t2cSnWcP2QWkFMAUKBZFKN3vb72CDzk/rFWx9wDXzoT6xt6Zfr97gkPdApyZIMoXG6dW37FKCA6bteqXVJGpfCXySQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht/BKdSLjiveRXBybAgpGUodqxIpmLslt0z/GcgtGi4=;
 b=OkPYg9pO9ma1Wx2KxIWfsz9ItmnOaFWz4lI/3cv/cfvROhS3ipcv5+oK47QAhF3pgcZGrdSPNEbgrKIDMc0OMizCtSFhUsd6zB+mz6zZDfScez8lFSwQIiX7xSg+lWuszE+8xgrVHMPRG37fo2/ikN0ZAqaLTZcHHHeiqYYvVvPvQ+UN119EKyVQnGMGGyIyBXv8RzgvWEorxO0wJSX0uzSO/IolG1y4VkjkqzrzKqLeWwmQo8PtdkfXF9uOlmBHE3o9HnDo580iIJH3gkK+jfOC0MIBpYGOQpwBwMr/dN/72b13kGn/l1joh0tcKgxzX1cGBR3vG311QqlWcdFTQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ht/BKdSLjiveRXBybAgpGUodqxIpmLslt0z/GcgtGi4=;
 b=zFsQPEuJudxoytZpAetsuw1wJeQNwszXlgPPlzvfDoiUZ+DtAgRzwhKoVoaT8WeKQXuRITnbddT3H2+WBeFxSU0w5/5NGTS9ZSSngbbQgTppKGJ2gW0AH6YKHK1e21tjAphSgASk+X1oKA1IfGLF5+lJMeufBtPCQPlojpUSD9o=
Received: from BN8PR12MB3092.namprd12.prod.outlook.com (2603:10b6:408:48::12)
 by BN8PR12MB3092.namprd12.prod.outlook.com (2603:10b6:408:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 26 Mar
 2021 18:12:31 +0000
Received: from BN8PR12MB3092.namprd12.prod.outlook.com
 ([fe80::5168:9411:6f38:b2ea]) by BN8PR12MB3092.namprd12.prod.outlook.com
 ([fe80::5168:9411:6f38:b2ea%6]) with mapi id 15.20.3955.031; Fri, 26 Mar 2021
 18:12:31 +0000
From: "Brol, Eryk" <Eryk.Brol@amd.com>
To: "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "Wentland, Harry" <Harry.Wentland@amd.com>, "Siqueira, 
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Lin, Wayne"
 <Wayne.Lin@amd.com>, "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH v2] drm/mst: Enhance MST topology logging
Thread-Topic: [PATCH v2] drm/mst: Enhance MST topology logging
Thread-Index: AQHXIaGZqkFFWQPVfEu/HhwY+pgTEKqVSaCAgAFJn2s=
Date: Fri, 26 Mar 2021 18:12:31 +0000
Message-ID: <BN8PR12MB3092499AAC8E26763D5175C3E5619@BN8PR12MB3092.namprd12.prod.outlook.com>
References: <20210325180614.37060-1-eryk.brol@amd.com>,
 <c9148c206727761644c31844f929d52ca19d00ee.camel@redhat.com>
In-Reply-To: <c9148c206727761644c31844f929d52ca19d00ee.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-26T18:12:30.613Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae09e3d1-12ba-4015-a6c2-08d8f082b8fa
x-ms-traffictypediagnostic: BN8PR12MB3092:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB309205A56E600AD083F64C3CE5619@BN8PR12MB3092.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: os4xcfx3vDb9P1AXZiCXeGdRRubqXVxVMoY9FlnfwsHJre84jfhIIBTEQ1H6FlLfKtG9lg+lgKYTcptX22wF/sgKEXogbEbhXXurXdscYJaY1oZtmVQWI0ho5QvA5WbvenaAMlN6iE25C2kxo4c37meq/Wc/4HlTPtGu3GZguLKb6wcxW6VwPq1xG3py7Ijj22yiPKJN83xxrhKTyaLbWt7GB+6ANl+WoJwd+c9QVudKHoEKRltXDR7t4tRF4eK8mhLLRR5fjtBkHBUba7rUKzn46P2ZfexTVboec11YYssCg0qcN1A3fwCPiz1dOqY3Y9ApMgtu0MeWAcWHK/LbsUxFj9cZCKuGRSYekTOf+P5ocU1NyqxJ4xsnfLYxpLQaHois3XVtB+wBZWdtdn5raIu4k9Cpu4QcmC25zhf790dFv+GDUgvQ/DiJggwJVUfe2Qp428HDy+b0YWbYIcV/Lp11+zbHJjBgJhz+p4/x8J3eWMzVW+VKKOJ4MxiCr5PQ/4DhuS6CnuOwNHxQLUQoMX7q3Sm1E1frnr9N2k76BVfjvBTNccV1KLoDgCgOKj9ZinPirqsJwEtoSTxsGR3pxvsGltmYahtn/QqBC+Gl2ncrLe/vfkHjaAwwXUr8kzjYlIKG1dJxr9E9x8I7bkGIp/SZHu1f6uP688F2oolE2bOz9uItORa2IFFg3aDW/U1C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3092.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(66946007)(64756008)(66556008)(66476007)(4326008)(76116006)(66446008)(33656002)(2906002)(7696005)(316002)(8676002)(26005)(921005)(110136005)(38100700001)(478600001)(54906003)(83380400001)(186003)(8936002)(55016002)(9686003)(71200400001)(86362001)(19627405001)(5660300002)(53546011)(52536014)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?JtgMsen4VXEaCHr3+q3Bh/lPUhBFuS6c1fixaD5CRVXWMHFd+WxCne5z0We/?=
 =?us-ascii?Q?z+XroKAIrZa6bn2QEuGTeGIDAYFOlSBJoul1FEjpHTuhIlDIoX5nTMjnXAbQ?=
 =?us-ascii?Q?ave+BbZlLJw23++DjXW204W+13Ej4ixEyTujLY0Y1dJ5c7W1JA17WyfQbVGZ?=
 =?us-ascii?Q?hqHsVG9YZGQGsfMy/QU1NV3dq/6T8mvUTswmYYBYiRzaQfU1qBpKPN2VxItt?=
 =?us-ascii?Q?b0UQy1Dy8pJMAXi7SXUpECZ4zTfaC+/TwQUfLKLLhyUD8WS5jURA1uWfzCql?=
 =?us-ascii?Q?1Gjtho2p5iHxd+zD6Yxsw2TQbyxgV/lISNFps8j2V5Rg7JdNotcSWcDK//G6?=
 =?us-ascii?Q?w/znOe+lrdVPY9QLsskk85ODdsak43zN2IyB59wWJe8rkFRqSw/NzLI34JlK?=
 =?us-ascii?Q?k2BXM4hk1Y7DwL4PZmQdke9TmB/T/kmK+JfTVxC1uFlSZm4KAc1EdLXg6fDa?=
 =?us-ascii?Q?K6Z035jGZp5kzRjVpNtmS9BeArppllgFCUYDdqYmqA2QSg7oxpkMLs7thXPz?=
 =?us-ascii?Q?PJYon8WdbbZ6bIcfJ7A1trtqgP1BFB8UBmK4NT9/D3K2NmIFw1+DHRmLxoNd?=
 =?us-ascii?Q?IwTkNDkKG7Uvh6Ttp8Up8v8nBv7KFmlCLP8NbqotTvmtOb2XkhzplE3riusJ?=
 =?us-ascii?Q?gxkIutbjODEWF2BHmIRvOHo4BAIXihilK/B0tbo4z3PUlMkoCqb/0dGDE/K4?=
 =?us-ascii?Q?gF4hJ+TdPMncVIpJVYI/tJYPczpT1rzx0pfGdUkptHIPPhdFCwHZq+uvA7xI?=
 =?us-ascii?Q?90XocvnfaxA3ItLbaQjPZqUE5OayE9lGknpT73jZDv2kCw9IVs5uVdoKx+1J?=
 =?us-ascii?Q?2sspBc9VXa8jfgMyJZ/WLoTggaz/BM/9+0ZRKo7HjUxb1hNKVvKqXkPoRBA/?=
 =?us-ascii?Q?JS95SikkMLJ3HvpUfkUyfIKhHlNnJkgQlcCDy7WdGau5u+HTqZy8YFNIf2tJ?=
 =?us-ascii?Q?xM2fjPHlHl4oE9qCY1It0+U4sRn+iGSQVVgFkHujK0Vs0mjimo4jXxxZHlLg?=
 =?us-ascii?Q?0yxWDufPLlTKQJyVSbUDOOKe6bXIBMeB0SE5nvM783CVKebuQAKFv0i48BlQ?=
 =?us-ascii?Q?D3P1OzjSpvrcYwMSIamyWfOQj8itx/LhJ3sjNHuVGLXbScdNyflDw3vCFRGJ?=
 =?us-ascii?Q?tfID1fuhtMxxXETqmBIyi1W17RL9nAtSM9r2tYVzzZEDCYC9NUTVbBWDw0wj?=
 =?us-ascii?Q?c8ZppG9HvG1Zj9NnXLKTeCdBfo6enaMNjSCd7HoYLbULbiYhpKsYJwxB1oJP?=
 =?us-ascii?Q?a5SYfo8AWk5BaI5oLI2LCiPf743OmvdXWEpQj+VDM+S8MBwqBapVDrbgHZLr?=
 =?us-ascii?Q?e4o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3092.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae09e3d1-12ba-4015-a6c2-08d8f082b8fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 18:12:31.0545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: glMnehRrhhJJG/ifp+Qu4CZXCYsyu1jF1Jb8Smf9iP7ZPVUEQnK2JZH7E4uMnTmQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3092
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0587246795=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0587246795==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3092499AAC8E26763D5175C3E5619BN8PR12MB3092namp_"

--_000_BN8PR12MB3092499AAC8E26763D5175C3E5619BN8PR12MB3092namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Lyude,

Yes, I would appreciate it if you could push this to drm-misc-next for me.
Thank you for your comments and review!

Best,
Eryk
________________________________
From: Lyude Paul <lyude@redhat.com>
Sent: Thursday, March 25, 2021 6:30 PM
To: Brol, Eryk <Eryk.Brol@amd.com>; manasi.d.navare@intel.com <manasi.d.nav=
are@intel.com>; daniel@ffwll.ch <daniel@ffwll.ch>; Wentland, Harry <Harry.W=
entland@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; Kazlauskas,=
 Nicholas <Nicholas.Kazlauskas@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>; Li=
n, Wayne <Wayne.Lin@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/mst: Enhance MST topology logging

Reviewed-by: Lyude Paul <lyude@redhat.com>

Let me know if you need me to push this to drm-misc-next for you

On Thu, 2021-03-25 at 14:06 -0400, Eryk Brol wrote:
> [why]
> MST topology print was missing fec logging and pdt printed
> as an int wasn't clear. vcpi and payload info was printed as an
> arbitrary series of ints which requires user to know the ordering
> of the prints, making the logs difficult to use.
>
> [how]
> -add fec logging
> -add pdt parsing into strings
> -format vcpi and payload info into tables with headings
> -clean up topology prints
>
> ---
>
> v2: Addressed Lyude's comments
> -made helper function return const
> -fixed indentation and spacing issues
>
> Signed-off-by: Eryk Brol <eryk.brol@amd.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 59 ++++++++++++++++++++++-----
>  1 file changed, 48 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
> b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 932c4641ec3e..de5124ce42cb 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4720,6 +4720,28 @@ static void drm_dp_mst_kick_tx(struct
> drm_dp_mst_topology_mgr *mgr)
>         queue_work(system_long_wq, &mgr->tx_work);
>  }
>
> +/*
> + * Helper function for parsing DP device types into convenient strings
> + * for use with dp_mst_topology
> + */
> +static const char *pdt_to_string(u8 pdt)
> +{
> +       switch (pdt) {
> +       case DP_PEER_DEVICE_NONE:
> +               return "NONE";
> +       case DP_PEER_DEVICE_SOURCE_OR_SST:
> +               return "SOURCE OR SST";
> +       case DP_PEER_DEVICE_MST_BRANCHING:
> +               return "MST BRANCHING";
> +       case DP_PEER_DEVICE_SST_SINK:
> +               return "SST SINK";
> +       case DP_PEER_DEVICE_DP_LEGACY_CONV:
> +               return "DP LEGACY CONV";
> +       default:
> +               return "ERR";
> +       }
> +}
> +
>  static void drm_dp_mst_dump_mstb(struct seq_file *m,
>                                  struct drm_dp_mst_branch *mstb)
>  {
> @@ -4732,9 +4754,20 @@ static void drm_dp_mst_dump_mstb(struct seq_file *=
m,
>                 prefix[i] =3D '\t';
>         prefix[i] =3D '\0';
>
> -       seq_printf(m, "%smst: %p, %d\n", prefix, mstb, mstb->num_ports);
> +       seq_printf(m, "%smstb - [%p]: num_ports: %d\n", prefix, mstb, mst=
b-
> >num_ports);
>         list_for_each_entry(port, &mstb->ports, next) {
> -               seq_printf(m, "%sport: %d: input: %d: pdt: %d, ddps: %d l=
dps:
> %d, sdp: %d/%d, %p, conn: %p\n", prefix, port->port_num, port->input, por=
t-
> >pdt, port->ddps, port->ldps, port->num_sdp_streams, port-
> >num_sdp_stream_sinks, port, port->connector);
> +               seq_printf(m, "%sport %d - [%p] (%s - %s): ddps: %d, ldps=
: %d,
> sdp: %d/%d, fec: %s, conn: %p\n",
> +                          prefix,
> +                          port->port_num,
> +                          port,
> +                          port->input ? "input" : "output",
> +                          pdt_to_string(port->pdt),
> +                          port->ddps,
> +                          port->ldps,
> +                          port->num_sdp_streams,
> +                          port->num_sdp_stream_sinks,
> +                          port->fec_capable ? "true" : "false",
> +                          port->connector);
>                 if (port->mstb)
>                         drm_dp_mst_dump_mstb(m, port->mstb);
>         }
> @@ -4787,33 +4820,37 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>         mutex_unlock(&mgr->lock);
>
>         mutex_lock(&mgr->payload_lock);
> -       seq_printf(m, "vcpi: %lx %lx %d\n", mgr->payload_mask, mgr->vcpi_=
mask,
> -               mgr->max_payloads);
> +       seq_printf(m, "\n*** VCPI Info ***\n");
> +       seq_printf(m, "payload_mask: %lx, vcpi_mask: %lx, max_payloads: %=
d\n",
> mgr->payload_mask, mgr->vcpi_mask, mgr->max_payloads);
>
> +       seq_printf(m, "\n|   idx   |  port # |  vcp_id | # slots |     si=
nk
> name     |\n");
>         for (i =3D 0; i < mgr->max_payloads; i++) {
>                 if (mgr->proposed_vcpis[i]) {
>                         char name[14];
>
>                         port =3D container_of(mgr->proposed_vcpis[i], str=
uct
> drm_dp_mst_port, vcpi);
>                         fetch_monitor_name(mgr, port, name, sizeof(name))=
;
> -                       seq_printf(m, "vcpi %d: %d %d %d sink name: %s\n"=
, i,
> -                                  port->port_num, port->vcpi.vcpi,
> +                       seq_printf(m, "%10d%10d%10d%10d%20s\n",
> +                                  i,
> +                                  port->port_num,
> +                                  port->vcpi.vcpi,
>                                    port->vcpi.num_slots,
> -                                  (*name !=3D 0) ? name :  "Unknown");
> +                                  (*name !=3D 0) ? name : "Unknown");
>                 } else
> -                       seq_printf(m, "vcpi %d:unused\n", i);
> +                       seq_printf(m, "%6d - Unused\n", i);
>         }
> +       seq_printf(m, "\n*** Payload Info ***\n");
> +       seq_printf(m, "|   idx   |  state  |  start slot  | # slots |\n")=
;
>         for (i =3D 0; i < mgr->max_payloads; i++) {
> -               seq_printf(m, "payload %d: %d, %d, %d\n",
> +               seq_printf(m, "%10d%10d%15d%10d\n",
>                            i,
>                            mgr->payloads[i].payload_state,
>                            mgr->payloads[i].start_slot,
>                            mgr->payloads[i].num_slots);
> -
> -
>         }
>         mutex_unlock(&mgr->payload_lock);
>
> +       seq_printf(m, "\n*** DPCD Info ***\n");
>         mutex_lock(&mgr->lock);
>         if (mgr->mst_primary) {
>                 u8 buf[DP_PAYLOAD_TABLE_SIZE];

--
Sincerely,
   Lyude Paul (she/her)
   Software Engineer at Red Hat

Note: I deal with a lot of emails and have a lot of bugs on my plate. If yo=
u've
asked me a question, are waiting for a review/merge on a patch, etc. and I
haven't responded in a while, please feel free to send me another email to =
check
on my status. I don't bite!


--_000_BN8PR12MB3092499AAC8E26763D5175C3E5619BN8PR12MB3092namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Lyude,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yes, I would appreciate it if you could push this to drm-misc-next for me.<=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you for your comments and review!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Eryk<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Lyude Paul &lt;lyude@=
redhat.com&gt;<br>
<b>Sent:</b> Thursday, March 25, 2021 6:30 PM<br>
<b>To:</b> Brol, Eryk &lt;Eryk.Brol@amd.com&gt;; manasi.d.navare@intel.com =
&lt;manasi.d.navare@intel.com&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;;=
 Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Siqueira, Rodrigo &lt;Rodr=
igo.Siqueira@amd.com&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlauskas@amd.=
com&gt;;
 Zuo, Jerry &lt;Jerry.Zuo@amd.com&gt;; Lin, Wayne &lt;Wayne.Lin@amd.com&gt;=
<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;<br>
<b>Subject:</b> Re: [PATCH v2] drm/mst: Enhance MST topology logging</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Reviewed-by: Lyude Paul &lt;lyude@redhat.com&gt;<b=
r>
<br>
Let me know if you need me to push this to drm-misc-next for you<br>
<br>
On Thu, 2021-03-25 at 14:06 -0400, Eryk Brol wrote:<br>
&gt; [why]<br>
&gt; MST topology print was missing fec logging and pdt printed<br>
&gt; as an int wasn't clear. vcpi and payload info was printed as an<br>
&gt; arbitrary series of ints which requires user to know the ordering<br>
&gt; of the prints, making the logs difficult to use.<br>
&gt; <br>
&gt; [how]<br>
&gt; -add fec logging<br>
&gt; -add pdt parsing into strings<br>
&gt; -format vcpi and payload info into tables with headings<br>
&gt; -clean up topology prints<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
&gt; v2: Addressed Lyude's comments<br>
&gt; -made helper function return const<br>
&gt; -fixed indentation and spacing issues<br>
&gt; <br>
&gt; Signed-off-by: Eryk Brol &lt;eryk.brol@amd.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;drivers/gpu/drm/drm_dp_mst_topology.c | 59 +++++++++++++++++++++=
+-----<br>
&gt; &nbsp;1 file changed, 48 insertions(+), 11 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; b/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; index 932c4641ec3e..de5124ce42cb 100644<br>
&gt; --- a/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; +++ b/drivers/gpu/drm/drm_dp_mst_topology.c<br>
&gt; @@ -4720,6 +4720,28 @@ static void drm_dp_mst_kick_tx(struct<br>
&gt; drm_dp_mst_topology_mgr *mgr)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;queue_work(system_long=
_wq, &amp;mgr-&gt;tx_work);<br>
&gt; &nbsp;}<br>
&gt; &nbsp;<br>
&gt; +/*<br>
&gt; + * Helper function for parsing DP device types into convenient string=
s<br>
&gt; + * for use with dp_mst_topology<br>
&gt; + */<br>
&gt; +static const char *pdt_to_string(u8 pdt)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;switch (pdt) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case DP_PEER_DEVICE_NONE:<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;return &quot;NONE&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case DP_PEER_DEVICE_SOURCE_=
OR_SST:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;return &quot;SOURCE OR SST&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case DP_PEER_DEVICE_MST_BRA=
NCHING:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;return &quot;MST BRANCHING&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case DP_PEER_DEVICE_SST_SIN=
K:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;return &quot;SST SINK&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;case DP_PEER_DEVICE_DP_LEGA=
CY_CONV:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;return &quot;DP LEGACY CONV&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;default:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;return &quot;ERR&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&gt; +}<br>
&gt; +<br>
&gt; &nbsp;static void drm_dp_mst_dump_mstb(struct seq_file *m,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_dp_mst_branch *m=
stb)<br>
&gt; &nbsp;{<br>
&gt; @@ -4732,9 +4754,20 @@ static void drm_dp_mst_dump_mstb(struct seq_fil=
e *m,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;prefix[i] =3D '\t';<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prefix[i] =3D '\0';<br=
>
&gt; &nbsp;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;%smst: =
%p, %d\n&quot;, prefix, mstb, mstb-&gt;num_ports);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;%smstb =
- [%p]: num_ports: %d\n&quot;, prefix, mstb, mstb-<br>
&gt; &gt;num_ports);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;list_for_each_entry(po=
rt, &amp;mstb-&gt;ports, next) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;%sport: %d: input: %d: pdt: %d, dd=
ps: %d ldps:<br>
&gt; %d, sdp: %d/%d, %p, conn: %p\n&quot;, prefix, port-&gt;port_num, port-=
&gt;input, port-<br>
&gt; &gt;pdt, port-&gt;ddps, port-&gt;ldps, port-&gt;num_sdp_streams, port-=
<br>
&gt; &gt;num_sdp_stream_sinks, port, port-&gt;connector);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;%sport %d - [%p] (%s - %s): ddps: =
%d, ldps: %d,<br>
&gt; sdp: %d/%d, fec: %s, conn: %p\n&quot;, <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; prefix,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port-&gt;port_num,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port-&gt;input ? &quot;input&quot; : &quot;output&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; pdt_to_string(port-&gt;pdt),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port-&gt;ddps,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port-&gt;ldps,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port-&gt;num_sdp_streams,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port-&gt;num_sdp_stream_sinks,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port-&gt;fec_capable ? &quot;true&quot; : &quot;false&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; port-&gt;connector);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;if (port-&gt;mstb)<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d=
rm_dp_mst_dump_mstb(m, port-&gt;mstb);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&gt; @@ -4787,33 +4820,37 @@ void drm_dp_mst_dump_topology(struct seq_file =
*m,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mutex_unlock(&amp;mgr-=
&gt;lock);<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mutex_lock(&amp;mgr-&g=
t;payload_lock);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;vcpi: %=
lx %lx %d\n&quot;, mgr-&gt;payload_mask, mgr-&gt;vcpi_mask,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;mgr-&gt;max_payloads);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;\n*** V=
CPI Info ***\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;payload=
_mask: %lx, vcpi_mask: %lx, max_payloads: %d\n&quot;,<br>
&gt; mgr-&gt;payload_mask, mgr-&gt;vcpi_mask, mgr-&gt;max_payloads);<br>
&gt; &nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;\n|&nbs=
p;&nbsp; idx&nbsp;&nbsp; |&nbsp; port # |&nbsp; vcp_id | # slots |&nbsp;&nb=
sp;&nbsp;&nbsp; sink<br>
&gt; name&nbsp;&nbsp;&nbsp;&nbsp; |\n&quot;);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D 0; i &lt; m=
gr-&gt;max_payloads; i++) {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;if (mgr-&gt;proposed_vcpis[i]) {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c=
har name[14];<br>
&gt; &nbsp;<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;p=
ort =3D container_of(mgr-&gt;proposed_vcpis[i], struct<br>
&gt; drm_dp_mst_port, vcpi);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;f=
etch_monitor_name(mgr, port, name, sizeof(name));<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_pr=
intf(m, &quot;vcpi %d: %d %d %d sink name: %s\n&quot;, i,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; port-&gt;port_num, p=
ort-&gt;vcpi.vcpi,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_pr=
intf(m, &quot;%10d%10d%10d%10d%20s\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; port-&gt;port_num,<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; port-&gt;vcpi.vcpi,<=
br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; port-&gt;vcpi.n=
um_slots,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*name !=3D 0) ? nam=
e :&nbsp; &quot;Unknown&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*name !=3D 0) ? nam=
e : &quot;Unknown&quot;);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;} else<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_pr=
intf(m, &quot;vcpi %d:unused\n&quot;, i);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_pr=
intf(m, &quot;%6d - Unused\n&quot;, i);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;\n*** P=
ayload Info ***\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;|&nbsp;=
&nbsp; idx&nbsp;&nbsp; |&nbsp; state&nbsp; |&nbsp; start slot&nbsp; | # slo=
ts |\n&quot;);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (i =3D 0; i &lt; m=
gr-&gt;max_payloads; i++) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;payload %d: %d, %d, %d\n&quot;,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;%10d%10d%15d%10d\n&quot;,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; i,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; mgr-&gt;payloads[i].payload_state,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; mgr-&gt;payloads[i].start_slot,<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; mgr-&gt;payloads[i].num_slots);<br>
&gt; -<br>
&gt; -<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mutex_unlock(&amp;mgr-=
&gt;payload_lock);<br>
&gt; &nbsp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;seq_printf(m, &quot;\n*** D=
PCD Info ***\n&quot;);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mutex_lock(&amp;mgr-&g=
t;lock);<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (mgr-&gt;mst_primar=
y) {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;u8 buf[DP_PAYLOAD_TABLE_SIZE];<br>
<br>
-- <br>
Sincerely,<br>
&nbsp;&nbsp; Lyude Paul (she/her)<br>
&nbsp;&nbsp; Software Engineer at Red Hat<br>
&nbsp;&nbsp; <br>
Note: I deal with a lot of emails and have a lot of bugs on my plate. If yo=
u've<br>
asked me a question, are waiting for a review/merge on a patch, etc. and I<=
br>
haven't responded in a while, please feel free to send me another email to =
check<br>
on my status. I don't bite!<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN8PR12MB3092499AAC8E26763D5175C3E5619BN8PR12MB3092namp_--

--===============0587246795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0587246795==--
