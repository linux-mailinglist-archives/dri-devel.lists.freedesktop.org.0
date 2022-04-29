Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F579514250
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 08:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E38210E422;
	Fri, 29 Apr 2022 06:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E9810E422
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 06:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CW4t/YxXEw4NDOTiHXoL4u3H5iySQAD3pEEd2THKdZC4y5QlB4nzv4oZxZetTtXp74taL6FtG9AN5rHIXYZrbo8Ym269b4Pi74tLVUrFogjAw8OZA9Aa6JiUTY6upJfvu3oBUAFQQSKEVTqTFoKJfzTfodcqGkDb7aGYjnE0M3SEDcBQC7MF05WFDH0cTGAh1CpBq7RDpiirtsEzmfYocGGN3xS9z0kR4H+p2vAJc+6V8CMTiu/d9BYCYPGkVYoXUETzeRwpcD5eJjFXtQDckPmsWT9C9Y1cgJXygZdeNvdcyPBfOrUYcUVNRCm8MhpbtviVVyMJ3FSiQOTRAcv0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaFHeHkZknDA9m5iLhM0NgZgj/cS5hljRfDSuuDkUp0=;
 b=nLJlDhU6DFL6tRAVIWAsIKCH3xrNcg4jEAskwqsxxeq4PrdMGYdLcwZEdXS+2E8fDgJNWg634LIAGSfozKMlydi1s+cFxPbYtC0TiHok7IW2Bw6ska+DRA9XHhhji2nDg2/WeJ/pKg4swfdn4qxMd0voQ6SV6I65NW/TUqJLSQoZcgNCZDc6odEZLaEUfuWBDWc1CozZZImrvtGTsayKROLRnnMpH7ZDmFFp2A6uCgh4lB0jQWJvB4jNXZXrbIbuMSFOuh/0dGY7GOufw71YVBZul/joIs5YsOeAGYzNgo6DYgb8rKYhNI1erSAZNuGmHx4LHrJ9lfGkSvtU33+yfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FaFHeHkZknDA9m5iLhM0NgZgj/cS5hljRfDSuuDkUp0=;
 b=qSeyYWeHk8kUU+6z7vb5Pva+2kHh3HE0hZa79v5Ob3fDBvIEjB5AVq9lmNCSSgOZPbRdVr9jX+iKQZcc6aify/4Ro8zi0sXxOjY8tQSXCc1jgVUiQMpZqJVYoB+MXOfYmkvohnCw6mCkGDsnrnaVWLngFxcwypYmeaKZCXSTSXQ=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 06:28:38 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::1c90:f807:7b0b:a862]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::1c90:f807:7b0b:a862%8]) with mapi id 15.20.5186.023; Fri, 29 Apr 2022
 06:28:38 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/dp_mst: Lower down debug info level when receive NAK
Thread-Topic: [PATCH] drm/dp_mst: Lower down debug info level when receive NAK
Thread-Index: AQHYWv5zaJrF2zlKwUqrxh/c7Uuhe60FiMGAgADlt7Y=
Date: Fri, 29 Apr 2022 06:28:37 +0000
Message-ID: <CO6PR12MB5489818EC779BAF77C30D78DFCFC9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220428124944.1683680-1-Wayne.Lin@amd.com>
 <274af067a52ce665def00170c35adb5002d500b2.camel@redhat.com>
In-Reply-To: <274af067a52ce665def00170c35adb5002d500b2.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-29T06:28:41.577Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12c6c283-218f-4995-55e5-08da29a97ecf
x-ms-traffictypediagnostic: MN0PR12MB5930:EE_
x-microsoft-antispam-prvs: <MN0PR12MB59304DB1961FEA5F5E9D69A1FCFC9@MN0PR12MB5930.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: httAsORqaY0Y2KiiZdlgaw6cQ8tv8wRxJhwQ2VNsCvHpTNCl3QrCmV3Dj6ir+KOgx/qznbSWpnvlrXfmHwsLETPx35QMzyhQl5GGv+2W+ZQEwvtlM3izrhpqFDUPnZucODUiq/PP6xVw2YxVRvxb75rmJM2+TqnKhadqJ8LgirO6QjmsXGYy2PLCOyP/V0dfUMGS0FENl8OeYXXodmhqax8P+N6mxyP2GgvK+MtvBXxIuV/bQipSvXVYwP+pVZCIFMfj8Z5WY6ecy2aSnIjKZ6uMycKs87UCo5l8pqh0+prEWR5A19p/zOifbUZPqQLCginEgHVCb85TroZrPIwEZb8ySICP4sj7Zkqibey8Kr8K2h7e8ZNd8+ayykh4WlOApCGASC/qvkTBgpAnh3pvYkAbAnDlWN3/Jhx2IZX4OhI/H7v1sTBWQyjH3O+jNOVbFoB7toUG9tk2UFt0aeLBe1D8IbDmlx/E0tM8BRo6t+xyPrUYXRAAeAtZz6q2TXUC8V4Jg6uTaG0zkFr+doaSCtFpMrmjfpKrg/qGcosImZUxfFNkOxYvVjsSIixSUeSy+Xf2EOKt2tGKlrXTmNLrWRo/ZxkzO8o9Q5xxen3gbAwNwnO05LayK329XnikvwdZAxlQxirwLQTT6CrsKDup/qqBOYgarOBFzLrxfabp7wrLOixO8vqoPkcRDQUFsvwJmWGDrvIUoA6LttMRNbHvhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(86362001)(33656002)(110136005)(186003)(122000001)(26005)(9686003)(316002)(55016003)(52536014)(66556008)(66946007)(91956017)(76116006)(8676002)(66446008)(66476007)(7696005)(71200400001)(8936002)(83380400001)(2906002)(38100700002)(38070700005)(508600001)(5660300002)(53546011)(4326008)(6506007)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?olY4gbhXRVHrWM3lWp2nhoWiXSZtX6CN3jVvCbfXtKvlno2VskHLkvV+mi?=
 =?iso-8859-1?Q?L3fiA5PNgtgRokHH5hftlxYBkkB9kiGfUjPBOYZYOVXt5cnuaGgS6sAvPl?=
 =?iso-8859-1?Q?TQjPuuxeB8pyXsCSS8//iAjxgTHUCOYYbYWbd3cfIJHPxxCsYL0plPWr90?=
 =?iso-8859-1?Q?pEwOd+OlOoJHC1REJ1LbzGDkxIrHpvxHxQVQDn7mYc86Xh1/m0KI5N2cmk?=
 =?iso-8859-1?Q?jb4H6muJ+ApiNv16urQ3++Q51zypsiq1eHKENWfMdmNToufrLqtkcEeLU8?=
 =?iso-8859-1?Q?Td2Q9z61KTnEXIR7KpV2EZTtlRTybmY4UiPsC6f+vh0Z/WRq6IWTEuwVgM?=
 =?iso-8859-1?Q?LtDOiWs6zbeLZ9N2P5MRyg3CwX7SOiAiccqz9pZFhyyccUQP+MBlBDcLAr?=
 =?iso-8859-1?Q?b7zPW8hGTwYNZjow5NXII7vaBpljJN+M7KtSzI5UFDPBMswVhRHJjyBQNt?=
 =?iso-8859-1?Q?vsJ+BK6Hiw2ZOY6To8V40tA4yGcsaJI86Ns+C5rGT+44c46zxng5w5fjiF?=
 =?iso-8859-1?Q?+7ihNq2zrsT+sE8JsVckoj2fh3/v80RUn8Ftik8pYufJewYfIW1tIyB9YH?=
 =?iso-8859-1?Q?w6loRIz5InAQTJeWCCTc8qG8P/v1xm7g1516mUWZuueqvZx9N6Nb9Tv5Ok?=
 =?iso-8859-1?Q?eHu3zIUDlY6fKUjwfVt3cKrO3C3LH+kJFsfi8n/MonGaCQYGc/ojHfPb/u?=
 =?iso-8859-1?Q?CT14EL26TcRanWXQVKI/5WBUwytJ3rwfXT4JGv65RNycbgo67XiVuiSoNA?=
 =?iso-8859-1?Q?rb+Gb3pJQ/nUigG60NY/8QKvCr9l585ZMFlJDeWDkcfuaxFPVPgBtAyFtm?=
 =?iso-8859-1?Q?051bQou6csBPVFsoSZkYoYjxIuok6a0wF+y0pw/JAwlHmc1/kojNdq8SDG?=
 =?iso-8859-1?Q?edRagTLh+VpzwQqX21ypzwEOaG0fSzcLKQh3OyYYbKiehrAd0mW2Je/YKf?=
 =?iso-8859-1?Q?ayruZyKARhPXHkEGj4z4khpg2X+WVvw958pqMVpp5o1bTnCdpMUkXMA0zy?=
 =?iso-8859-1?Q?i79Z4zrdvR+MPXQQrkQFsRyZGNTYjFqtwfWTNIkbA4zAhkqci2lJN8rXM0?=
 =?iso-8859-1?Q?rBmb2vCPDCM0OQaR0Cm4NyTX7LCkMCWjgVlPC2mMWlEAVwNXOjZFwluiL8?=
 =?iso-8859-1?Q?j2oUx/l3A7VzXooIMlsIOfwq+xQqs48pj/TnXJ2HzSnS8endgeZ2/MbtcH?=
 =?iso-8859-1?Q?VJ5NtkDn94+eOKIr9N9wpOpLABJwLTO71ocXsSf5PDiwQoBN33FmH2bLt9?=
 =?iso-8859-1?Q?WrZPNi27k8mPDoFVPzkCHZt7RRIbYN8XLydiQMpIB0dwwJS2ojrVfxPlOL?=
 =?iso-8859-1?Q?wVcSz6mSXo+AHT32qnpHD08BbXVfgUJ9Pa3ylEpJARtfYLnk9CSZG5gR9O?=
 =?iso-8859-1?Q?NdsQLWwct6h3ALyFovKZlPYvtyUJPptdPR5zGiBKljsuSslvPtZYI+1ZsC?=
 =?iso-8859-1?Q?nALO6Xn8BsZW3z61fl2Q3aEMMTDTzl6BjI7z1pa7vP8vVfigtudY5b6yLG?=
 =?iso-8859-1?Q?qkPKTLlSVNiM0prJLGN4bH2WVLrlurTU9nAGy0bWO0qOLkwTuXOZN/bE7o?=
 =?iso-8859-1?Q?kJMe/yUNcYoAiQPnxgzMwMD2tG1U4brs0iAV9yfCPCxdQE6W8LljB9bb+n?=
 =?iso-8859-1?Q?htu7qNwPZ5uqqF2xNyrLdiTJEQbKwsPG60gVjF0lY+ATdH31dbWsgkR7ou?=
 =?iso-8859-1?Q?jv9UmoE3DzP6ld3LeG8nAVXojoTM3aT0q3CWYCbs6MGItTaoVKN9tJWoZA?=
 =?iso-8859-1?Q?/CNFglP06WG3vPzroSAG2ov2ozo3tWgRABzGNxSXP/RRjpc9Dlfa05Lbew?=
 =?iso-8859-1?Q?aNl8c3qWJw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c6c283-218f-4995-55e5-08da29a97ecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 06:28:37.9763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y67Tk+xOGIJwunBb8RCtVUWFblBjcPZut1DdUaN09O713/3i8RBTRFlmAjb9S3IQ5nMYuXlQaajSsV5N0xP31w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930
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
Cc: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

Thank you Lyude!

Regards,
Wayne
________________________________________
From: Lyude Paul <lyude@redhat.com>
Sent: Friday, April 29, 2022 00:45
To: Lin, Wayne; dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com; Wentland, Harry; Zuo, Jerry; Siqueira, R=
odrigo
Subject: Re: [PATCH] drm/dp_mst: Lower down debug info level when receive N=
AK

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a bit

On Thu, 2022-04-28 at 20:49 +0800, Wayne Lin wrote:
> [Why]
> It's reasonable that we receive NAK while doing DP_REMOTE_DPCD_READ.
> Downstream device might reply NAK with the reason and source should
> react accordingly.
>
> e.g.
> 1. When downstream device can't handle corresponding message in time,
> it then replies NAK as reason been set as DEFER.
> 2. When multi-function branch-sink device doesn't enumerate virtual
> DP peer devices for those multi-function down facing ports. Without
> virtual DPCD, branch device might reply NAK with reason as BAD_PARAM
> indicating this port can't do aux DPCD read.
>
> It's expected result. Not an error.
>
> [How]
> Use drm_dbg_kms() to replace drm_err() when receive NAK.
>
> Changes since v1:
> * drm_dp_mst_topology.c file path changed. Folder was rename from
>  'dp' to 'display'
>
> Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 8526aae75c6d..f27aa0b95bea 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3557,9 +3557,8 @@ static int drm_dp_send_dpcd_read(struct
> drm_dp_mst_topology_mgr *mgr,
>         if (ret < 0)
>                 goto fail_free;
>
> -       /* DPCD read should never be NACKed */
>         if (txmsg->reply.reply_type =3D=3D 1) {
> -               drm_err(mgr->dev, "mstb %p port %d: DPCD read on addr 0x%=
x
> for %d bytes NAKed\n",
> +               drm_dbg_kms(mgr->dev, "mstb %p port %d: DPCD read on addr
> 0x%x for %d bytes NAKed\n",
>                         mstb, port->port_num, offset, size);
>                 ret =3D -EIO;
>                 goto fail_free;

--
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

