Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0705D7B6873
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 14:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232AD10E0CB;
	Tue,  3 Oct 2023 12:04:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9210E029
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 09:45:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anMpCoLA6TzlNwH3XdJGlSsZ39kc/nnYQs97LjcZ1q+cTTCaLByorxZYrPLbPlrSIpbOOJOKVGSFe+qT2m02EBiyvPp2fw+rt3GiXUr2Fyav/AvPwkzEinsr3eDVMYG/DKAA5vo7rYAPMIOTt8xEqTFkpMSKTCNsZ5eYMVZdgFuGhvqpCtEwEBrbXw30GcwE5T/3rnR8ywVAc5FKrlN31Pcd+5hN1YsS/qVM0zeiodjErSCsUcFwglHOfAb7YnpeWPzKPp/+FU1MZodj+UKMo7OMmuXnhjMB+gCytfnTQk06JBNdTpMNMX9OqbKeTZ+lEOl1HbLikvYNIYFnS4SDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Lv/Kpnz6mMSYSFauiFmJH9ZWnV1F5rkLBgsWkjbsvA=;
 b=c1Aoig5w9iPcsAckwl5XD9KCPtBPMu+S4REcWRNvXhfQjxASrHW1liEypD3Ia51UF7AUlz7tqNQq9rJUSawEEj+H3+zvkj8gzPLijNC+eEPeuaXSjIClso18wvJUDjhSXWvMVZ+lfWNuw8bo+Uzka8az0N90Dbm4Ffy0XCKG0CrQDuCv0YqZut3BcjkFCrfk9jnNgRYR+Gj7hCZVp+6wbJT3Fuhwf7jZ/QRzbhQh/nqW/gEE7SlqzeEbbCGvv+JW3dkZb4mgrZqS5YgcC4N1OCcKA1hb4sw/gk/88Ddu+Lktl2hAkAdPJi7r98y6e1GeXl4poWC42YqRbMKmIsoKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Lv/Kpnz6mMSYSFauiFmJH9ZWnV1F5rkLBgsWkjbsvA=;
 b=bTPWi263SwNqCZlovDxAX/EnzBNMQ6UpT3fJ4c+BkuA9ynywoTMmAu0TL3+IPIJ/Ze1Wu/K7DIRPHVMmWgASkw1QUKcjDhXD/iazH+o8IBI3VJg+2LG/DgatBhPRXm18+XToAbbkUvq/usNwwNKVv4hLp8z/2tinIkLi8Y/UySY=
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:273::14) by DU2PR01MB8830.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2fd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.24; Tue, 3 Oct
 2023 09:45:27 +0000
Received: from DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f]) by DU2PR01MB8034.eurprd01.prod.exchangelabs.com
 ([fe80::ad2b:a1e7:8828:ba2f%7]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 09:45:27 +0000
From: Flavio Suligoi <f.suligoi@asem.it>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: RE: [PATCH v3 2/2] backlight: mp3309c: Add support for MPS MP3309C
Thread-Topic: [PATCH v3 2/2] backlight: mp3309c: Add support for MPS MP3309C
Thread-Index: AQHZ76uOJLAmrZru10GD/iMoRWqxtLAtFlmAgArGkbA=
Date: Tue, 3 Oct 2023 09:45:27 +0000
Message-ID: <DU2PR01MB803463A09B0213D2072F598DF9C4A@DU2PR01MB8034.eurprd01.prod.exchangelabs.com>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230925122609.78849-2-f.suligoi@asem.it> <20230926131039.GC4356@aspen.lan>
In-Reply-To: <20230926131039.GC4356@aspen.lan>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR01MB8034:EE_|DU2PR01MB8830:EE_
x-ms-office365-filtering-correlation-id: 8d909c22-1ac2-4d0d-8f57-08dbc3f57955
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ke05CiU6b6rCOihgyagDbGz0snElD4tc6kaLrXOoAvwl731+n0/c3LdaBmo3AAaAa1k8uhcRvAoMg70G8X8lN7RgmGnTWezKtWeKQAW+JwU5tbPIeyJ0qrg3TYxLwUEuARi5jIS7chI/KuggqW7o/vNlpiCYRmN+040BTRgAjFyCgxWta7bW/AguUfsCUC7XdX5biS8qoR+UWze06ycs3ITA0xT3scftTkXwhwlmIS48f8B2OJmr6hHtasjN3SdGVp+ZDmdSJbUmvxRZMaAAGsPtj5YigeOq+9BbEIj2H3x+MFqOp44btP938Rv1zfKU8tr5vOBdIr9cTtWtQMZroe2JkcOuALZNHcet6R2oUEYiNATVwfGKZX4gphJ1vxsmYfTFV8BfNoUXiAXHu9X9AgYl6BkQgRoLs1yTbQiJO5qYqpQW8povHks3NKBCeaI7536vJ9EH8JiG2xRuUjmMPC8Npn9Vj556OhsEIzJ7rFWikcjS/HkjrzGj2oNr4w/ezEiJ8IsQgT7TGXy6T7cIiUnNrFKPlUZx7LcgBg2pImDyxoW5mwCQ9/zVGxa6+YZ9Ao2wlMbECKbk9nCxBixjMQToyb0L8UAsK95+9HgutZq7fE47k10pYTUhCCaBX1ex
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR01MB8034.eurprd01.prod.exchangelabs.com; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(376002)(39840400004)(136003)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(55016003)(41300700001)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(6916009)(316002)(38070700005)(38100700002)(478600001)(2906002)(7416002)(86362001)(52536014)(33656002)(5660300002)(8936002)(4326008)(8676002)(83380400001)(9686003)(122000001)(7696005)(6506007)(71200400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Liys9P61dqRZ0go2NaTn60/SxyJLMVoQN+fKa1yzSr9NEycpfZQ4qp42HmWE?=
 =?us-ascii?Q?bzGGs4H40rxiN1lowpdhkh6YVtjZ3GuzLn8zbTea2f4cYkWoOxlCIVhkgcOP?=
 =?us-ascii?Q?NS7LJLcZFmxofUqlIuHKhFS/HNrQxnIlZyr/fbcvUWjQwwDMv9VZJ9zWprng?=
 =?us-ascii?Q?1X1RTzVqqWTlWVjiVNqbnnQ2IFv+VWlUVJwc6Ps5kYL1dZZJuHueTAniTO2Q?=
 =?us-ascii?Q?as9Z710SoegX6flMc7o/1KBjcPGUcOrp7reXx6QMjRfC4ArX8xKSuvO/Y93/?=
 =?us-ascii?Q?EDRvYX0pGS18dmMzRoijvTK0YTFMhLmNlJsQ283T2ZTO1j8jtjAOhmM9lLE8?=
 =?us-ascii?Q?hqf93JQaR27HKk5B5DUxZyb0+iSw3ajGxzatlqyNnTknjQU7tgL8Tw7IgeGj?=
 =?us-ascii?Q?R0z/B/ES7A9giVId2vEBiGHvXGbHNGl+oi3rGTGXYN+b2pB09ZdSrItQS4XH?=
 =?us-ascii?Q?WzzloP3N1J2IG33gal7mFPD3NVQuT7FGROm/2Qjw0TAK4LV/CLiGHyVYxlo0?=
 =?us-ascii?Q?XalTmnTjjv9SotQWnPGkIrZUq4qZxj0BAv8zli30WupYGdQmgbuJpIG6R158?=
 =?us-ascii?Q?AX7mzoLC26FIAJ/bnee//vUdtBCC2UGD241pAChev0v6YmjmdZeti60HJK8D?=
 =?us-ascii?Q?Gp01If7hiQCqxnTxGCQNeP1lAMz8QNzc8slttiZAlJX/ntcqmYEhMzqjIbOu?=
 =?us-ascii?Q?GDjUNrlqluq08F5/jBWS6lqCojsInetT6gsV6WWkcMDxF3evMT/YlN93dNzm?=
 =?us-ascii?Q?E2r8cN/kGZk5ieOVxFY1kb0uZqF+eJTf5SOjxBQ7Qriqd0cu9d37SAqBvk/c?=
 =?us-ascii?Q?82nfclizTbxkshuGaj3eFQBjYaIpD/QRnJHcapy3D6Yx1628UhvwW0MnKpLn?=
 =?us-ascii?Q?hBXCxBKjcTH7Gwf8IRhdzybvIUj8qW2XLiISuwId4UCTNfsXLmUkXnMpnxS5?=
 =?us-ascii?Q?6g1BiDAC6LPWJ5K5SSWjWUSYu86F2IEWRmwsSmjeFQYadjpXXCd6mKhesmRb?=
 =?us-ascii?Q?TuJyg70gV0HbvFJrUsHqcV6VfnRBN+ICdc15m1AStkbpQmgELfuOq79aR/Kg?=
 =?us-ascii?Q?udx2DK8kqAgNTLBd4Fh9b8lYLqNYK1qg/DhUxNqEL5UpEKtiIgAOrUJPCJdb?=
 =?us-ascii?Q?5qZRAVTYijwNQiymYMLgDM7F0NaqFWbzJkoy1r1kP+NUUKAB/LZcoQEXHtkj?=
 =?us-ascii?Q?RTiIG47ahJYZ41rEjjwAWCwW8CJoG9S8ntnolnqBH7PrqC1ArCDs07HW2bfh?=
 =?us-ascii?Q?3kLIG0qPABcfBxiMh33KAnPVwsGu2gRABjyyukiJ9pWReD7Tys5mbgu+wGdO?=
 =?us-ascii?Q?L/tPi+MImyntoMCIqkOLIARYIWy8NA8nxuRWs1JzzRDS2foD+TdeR/LV09WI?=
 =?us-ascii?Q?MyHAducF4TbiZdjBub3fGfaga5igRUbYOZNTnHYE9iY+JVGvB61/hWzINa/p?=
 =?us-ascii?Q?qHORjbxWSMbhNyW6aofQm77rvME/irATvuWWQNBoOA/mH6ObjmWjoX65Jc9T?=
 =?us-ascii?Q?P5G/CL2zd4xAEKyz/+umfxm++NT0dX0KPEPpubsaUw0gJDucnvCt52Eu4zOw?=
 =?us-ascii?Q?UDgA07dZTEGgp3pQa18=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8034.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d909c22-1ac2-4d0d-8f57-08dbc3f57955
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 09:45:27.1536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fAgZ+scHh83Ke9Id93EhUEIB0Jz+bWPUGCEHVtii8Lk0L2vU+MljoJmjMcSUdiOWPWvfPaV0kCXiASYR5oDVhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8830
X-Mailman-Approved-At: Tue, 03 Oct 2023 12:04:48 +0000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

...

> > +static int mp3309c_bl_update_status(struct backlight_device *bl) {
> > +	struct mp3309c_chip *chip =3D bl_get_data(bl);
> > +	int brightness =3D backlight_get_brightness(bl);
> > +	struct pwm_state pwmstate;
> > +	unsigned int analog_val, bits_val;
> > +	int i, ret;
> > +
> > +	if (chip->pdata->dimming_mode =3D=3D DIMMING_PWM) {
> > +		/*
> > +		 * PWM dimming mode
> > +		 */
> > +		pwm_get_state(chip->pwmd, &pwmstate);
> > +		pwm_set_relative_duty_cycle(&pwmstate, brightness,
> > +					    chip->pdata->max_brightness);
> > +		pwmstate.enabled =3D true;
> > +		ret =3D pwm_apply_state(chip->pwmd, &pwmstate);
> > +		if (ret)
> > +			return ret;
> > +
> > +		switch (chip->pdata->status) {
> > +		case FIRST_POWER_ON:
> > +		case BACKLIGHT_OFF:
> > +			/*
> > +			 * After 20ms of low pwm signal level, the chip turns
> > +			   off automatically. In this case, before enabling the
> > +			   chip again, we must wait about 10ms for pwm signal
> to
> > +			   stabilize.
> > +			 */
> > +			if (brightness > 0) {
> > +				msleep(10);
> > +				mp3309c_enable_device(chip);
> > +				chip->pdata->status =3D BACKLIGHT_ON;
> > +			} else {
> > +				chip->pdata->status =3D BACKLIGHT_OFF;
> > +			}
> > +			break;
> > +		case BACKLIGHT_ON:
> > +			if (brightness =3D=3D 0)
> > +				chip->pdata->status =3D BACKLIGHT_OFF;
> > +			break;
> > +		}
> > +	} else {
> > +		/*
> > +		 * Analog dimming (by I2C command) dimming mode
> > +		 *
> > +		 * The first time, before setting brightness, we must enable the
> > +		 * device
> > +		 */
> > +		if (chip->pdata->status =3D=3D FIRST_POWER_ON)
> > +			mp3309c_enable_device(chip);
> > +
> > +		/*
> > +		 * Dimming mode I2C command
> > +		 *
> > +		 * The 5 bits of the dimming analog value D4..D0 is allocated
> > +		 * in the I2C register #0, in the following way:
> > +		 *
> > +		 *     +--+--+--+--+--+--+--+--+
> > +		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
> > +		 *     +--+--+--+--+--+--+--+--+
> > +		 */
> > +		analog_val =3D DIV_ROUND_UP(ANALOG_MAX_VAL *
> brightness,
> > +					  chip->pdata->max_brightness);
>=20
> Sorry to only notice after sharing a Reviewed-by:[1] but...
>=20
> Scaling brightness here isn't right. When running in I2C dimming mode the=
n
> max_brightness *must* be 31 or lower, meaning the value in brightness can
> be applied directly to the hardware without scaling.

ok, right; max brightness is 31, fixed

>=20
> Quoting the DT binding docs about how max-brightness should be
> interpretted:
>=20
>   Normally the maximum brightness is determined by the hardware and this
>   property is not required. This property is used to put a software
>   limit on the brightness apart from what the driver says, as it could
>   happen that a LED can be made so bright that it gets damaged or causes
>   damage due to restrictions in a specific system, such as mounting
>   conditions.
>=20

ok

>=20
> Daniel.
>=20
>=20
> [1] I remember checking if this code could overflow the field but I was
>     so distracted by that I ended up missing the obvious!

Thanks and best regards,
Flavio
