Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB4C93B1D6
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD2810E06F;
	Wed, 24 Jul 2024 13:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="e6AR/A3+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4C110E20E
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 10:02:24 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3dab3b85623so1860195b6e.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 03:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721556144; x=1722160944;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K69E0Qi/SYeo7Mg2UhPiJ/gYROAl/XUsUwpXJ+s9KP8=;
 b=e6AR/A3+iJ15jiK2oQkN71TwwExn6lKy7QTLjzfRMRGEfWgql20ySr5rEKJitcJF5n
 7jg3sOAs+dtHpF5HufZvzeew/QpkuimxKeU5GduhG4bm45zbMviqLHexFBGcET4AqtsD
 akagyLzb8N0+5wItdO8sV0/sMHQqY06wI/sOwUq/zAcQ71Fa8iqBs/vt/W6JS8m1S1H2
 WuIU1fBnmjRDFt+nIbCXkXbDSjYwhc6LvNRB9lATUb349deeatJPEpb+YncXqJnOfvUa
 s2WmsRvxgf43sQzrfKH60I3L6aqcFXUaRTdb7FgPVlCwOYWVhCqZoBaQRDV/aCQXX7iM
 f62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721556144; x=1722160944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K69E0Qi/SYeo7Mg2UhPiJ/gYROAl/XUsUwpXJ+s9KP8=;
 b=dnuJRuMQU7JvKMqPEue6GcanM3nLoPlq4Hg1mPj8fKYzLE6MJQzSj2XiA18eAWGKBm
 MQiOv0McKezKea7gNjF/es69PUD6pQDn90LMJcl03mWjdv6k7UGmQq0JcOSZASIqVt2D
 bNIKadq2FHbzF6uZjX6sg6f5wODZbsOcAhDCW0vO8W7mizc/6PPJxgyDfrEleHzYBlz4
 5uyVnW+/OpLx++IzjHnenGOnD3kjGrvAIRFP71xBWNNAGLS2XBFxqeqO0OOmzKHxHzca
 doJDRoXWIQcLkiKXqIr709FjH7p/MN0IbNrO31P4ELM3aTDuzHmUZf9N/VIbTF/FHb4M
 Jttg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpondGCPJRrW1+tYU6957IwB4y6wPxg8Y6xcR9mLrSpU3Wq6INTl5HbKmdq0eZiYEoPPjRtkiqnqizjiB7X/+553NXYbqZsi2fMaA6mboX
X-Gm-Message-State: AOJu0Yw1x7rl9M4fmkGLwDTu3QJz/A7ZVr2bE3SXKN1TPoDXxGuCChkd
 cw5zR0uRYJqC4QzADG1NwBj5oFuGktzLxBG6/kvKudd5V5wU3qGGd/qAZEIkhqAn5Gw2N1TMw51
 MUJ6OmF7Y0zvDEPfcQG9o+gxEkLfBdpYRIWHF3Q==
X-Google-Smtp-Source: AGHT+IE4jYsesZgP43nY83LMQ+6R9L0g10fIOLTHWCBect7kUQXEPNi+qA2PF77dYu5IiA4eOHf9tjlyK0QTpFuUZYM=
X-Received: by 2002:a05:6808:1283:b0:3d9:9e76:4977 with SMTP id
 5614622812f47-3dae973dae8mr5781403b6e.13.1721556143458; Sun, 21 Jul 2024
 03:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240717093925.3017-1-terry_hsiao@compal.corp-partner.google.com>
 <CAD=FV=XM7X5J6rzu5gDdmDhJ4Ut8raC92HvcnHmRJmWY7_boSA@mail.gmail.com>
In-Reply-To: <CAD=FV=XM7X5J6rzu5gDdmDhJ4Ut8raC92HvcnHmRJmWY7_boSA@mail.gmail.com>
From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Date: Sun, 21 Jul 2024 18:02:12 +0800
Message-ID: <CA+hhT39Xi61KwQjv-hAzt6MYfCW=KDyJx5gytJ=PwjKqEBrEqQ@mail.gmail.com>
Subject: Re: [PATCH v1] drm/panel-edp: Add panels with conservative timings
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="00000000000064672c061dbf060e"
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:47 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000064672c061dbf060e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

Thank you for your reply.
The patch has been modified and will be sent to you shortly.

The timings are set based on the panel datasheets in IssueTracker
<https://partnerissuetracker.corp.google.com/issues/348109270>
B116XTN02.3: B116XTN02.3(HW 9A)_HP_ Functional Spec_0617Y24.pdf
<https://doc-2smg-1nh0-partnerissuetracker.corp.googleusercontent.com/attac=
hments/mq0gcoa29tnq74780las1lal5ftnfoo4/ph5qkheuqvg2fvob27asjkgq7ff33mkf/17=
21554200000/166959/111337015573342552177/348109270::57531111::166959?dat=3D=
AFNnbnkhQm7XsXxWOBuDk0VIJvUKBHdjcgGgSwwc58sMbB-fgXwwoppdVYlgxvb5E9C6k3p10Ia=
B03CiVzkc1wrC7aGowJaWB8LKQtrY0WN90uO2nx1AY3alC3Dx_olx852xGfomeOWXEIcQohwsoL=
Kqd4XeHvqFK2TxspYqQFONYqVbOh-8d1mndFFn_6GQjKRSIlQoNmJuhzRZiUucP5hlomcztxgBC=
QUdD146sjIP51dC4ocbuKF126f0IFumyv-LWPT5bRfTyY26GxWpR9iCgctZXKVi8i8dfEjFakoO=
pXHUAV2gH4argtvgZeJ8ToXyEZ54MYLMwUguC7C_ksDbMfBgMg0aYmicKYNVZjLgJaTgo4vhs_Y=
vKWs2NObJCJqai-rhhYXR7kdX79hajO1ZfdUlr3Cq9uaWHvYdkjm7R_1FoNluXI0YJhFf4vNw3C=
JMqHgaS5Mo2Ixbq7VtR-NQZNdgW5B2ZWlxBovJ97vtkKkvW1n_Yl0xIUfrjDO__gEQoYlaKwud0=
o5lZG8wIDqD30AmVvg7LdQp1uGufdwqw3N2DISsabokWWNzkuP0qJK77ZJP3cDsssxwUvrrcPZR=
ekgHP1V4sFrH0fshaeGF8DRX2Bhauxg6NsuZ_U_NhWqWYetxaG8XGk8m0xFGgxe3iMg2FQf5Z5t=
Wxm6g4nlpugr6dp_oC0OidR2ouR_Rc3WkTpUZjMoEb5S9l7kpWOscgxWv8JWqtPrQo8xqvPooEN=
CjhUlm0owlbLjmSggoa8PHtf5x-LdoQQeIjK2arIzkUlvkYzX1kiWEsx9Y1L0kPHSrYSWMziV4U=
suz9R-kcpP_Es4_weQtXeVhj7z7Yq7eA9G-Y16GuOYGQk6VNjDflb-fCejHupqMNisorVv3NvE8=
KL85Gd0tf6zbkSubjbBIW-QOx1kuw5ln6yxgrIawv9wyNhdDpVgylIXWpzGhv65ONC_DhzJ2&u=
=3D0&s=3D1&q=3DAN9yeQIX-hB1AG6zTB8bPveFC7EV1leXl8SkDXJr0Tka6ycIjWX8ZwTjeESr=
Xm50JZpXwyJ9xR_alpiPkDDtf8jBIfQG&download=3Dfalse&nonce=3Ddo5hecj5bo25m&use=
r=3D111337015573342552177&hash=3D1lol0e27ank5bl898i6qdjckn21f5dmj>
B116XAN06.1: B116XAN06.1_7A_HP_ Final Functional Spec 0617Y24.pdf
<https://doc-1b40-1nh0-partnerissuetracker.corp.googleusercontent.com/attac=
hments/mq0gcoa29tnq74780las1lal5ftnfoo4/3pivkjc9vkais9l7gdh7hu01s0ltt72f/17=
21554200000/166959/111337015573342552177/348109270::57531255::166959?dat=3D=
AFNnbnkUmg9pDZRA9YoNk_ndYM2GLak1BqkRj5pcgSjYp4puxXniZsWfrsHq3sLgfVVIFoEg_DH=
53n_qYSZLXMLyZ_kKWiIEr4mkTwy-Nfsno2wJnh3toGGngKVFfEzkPuIAAa61iF9Myhp9nrHeAj=
OAn6UoQ-CQ8vtWDYe1kq_O5OfryergDK6KCzTUq3WmifCWRPkRKbgeIHjyns0bjsfU5hzP6G7ie=
3qWgX-QKkOR5zMafKyC62bfV-Xkty9jSH3NTcWzQN8IAyjQ5N1wbzJZhlIL0AkpGoyXr2loBVdd=
7XSRxInZVEh_8ZgRte-woLWc-oQ8I5WdW0dDxx2yR8hQj1Q83A5BuvD-T95MgKbLdHQOhUdAbE6=
Jh276yrYyyH0KjnTKqg-pPI3fzy8GR3j_jv9eXAtdWIcARu-T9VmYd7rCJVwO8fa9xO1NS33p8u=
jJGBuKcC5ITB98QM_fhRAxdxe74GElO7njScL9_9bUckDJ6xLsXFbDX-69AXiONbZcO0QPA2Tx0=
4YguWsfvZOY7EWRufAWFlAidHoAh9-YFNd3_GOtsBl_jqcIhOI615OOLkzl22OdaGBvrFWMoj5W=
xKKtyRh4AuCc2f99Q_HB8OElVLgQKF6Wf7eDieptAXsakmhOXLNRsC9qfDVQ2Fh8h0G0lnQrpA4=
-DJPCrnM6qynsmz80QTGQnWfflDpjYlIaK5chFfoGmAaQnjN6rxJyeofVi9dprKo4Cjw3xJ-Isi=
42vUQOA_1sJO4NT-kxEvjbYB5TqpuxuaaKkmzNCDrRXXO0AKvIn3_vb8P1r1eq2-Vxt-7flOiQ6=
AbwldWWfZ3S9uszCeWKNFtK4lkRV-pAPdAJDYutbL84w9Uipji9hNOtDia_jwkdBrjH-QzD2ISW=
HIt7EzezbmqiPYXAMeU4tfGJJAmQQrpcRKOactpapo0apVhXdYluYhCjqB2I6cW6V7kn53Ht&u=
=3D0&s=3D1&q=3DAN9yeQLR46gJqnFjKut6daG6FK9bPPkFA6UiSw9FXbX5fsaXkmXP3js1BJI6=
-f8AbJw8ZREFc3t6pLIaZrEIKWg6IDkTdg&download=3Dfalse&nonce=3D17mgmbgh7m0qo&u=
ser=3D111337015573342552177&hash=3Dfvo5saidhnnoaguhotrrdoks4p9hr7on>
B116XAT04.1: B116XAT04.1 HW 0 A(HH)_ Pre Functional Spec_HP_ 0425Y24.pdf
<https://doc-1n3g-1nh0-partnerissuetracker.corp.googleusercontent.com/attac=
hments/mq0gcoa29tnq74780las1lal5ftnfoo4/kkfplq8r6vhahkjuc1js66u5numr1eul/17=
21554200000/166959/111337015573342552177/348109270::57530823::166959?dat=3D=
AFNnbnmccGFOEK92PhWwCnzNpc5fH7G5B1UQXPHMMhgoMf1wVeG68KWmrAb4o27LDwYNh6yHA_W=
mu38TFh2ODaMa0IT85xFsp-8NpJpevs-nx4VD_BUPxw58L-L3sUSNSXBSyMTWYdssWtTVppJOxV=
mtK-kiKrT5Wz_YkOmbkjZ3RqxZqLgyviPvQwZbY5ZRkgeCSlciGktstztQbLqTikOMKC-nh4Pty=
TLWEwVk9OlVG2KB_X0a1VE6tydN37ggCrFtpolC4IhxVcAtDPmr-1nDyHMuL1vGlNCY6-KVPzkX=
dedspzYhaU80L2_-veVLXIq8tRTRPpLODBJLuDfw4wIY2GYzG-pq1y_pxjDXM0K8SShk2ClSAN4=
yUnPI3IsdJXMXwpK1CePg7hXhoOtxj9CzWiZYznuR_NinVKpMBK41VBrl8uJZ2p6tiYVhyHXXNg=
1h5PGO8OMymfb_Q5ed_2Wt1_4qjG70NA0jNCySFrfIZd3J1n5BXO0GDX-6khETkXl6uEsv3I8PJ=
DofcP8oABShAQHZrd9WjoavJLEu4fm6c0fUXwLNZNUFYaJE4Ve4JyQb209XQI5oGiw9qpnPE7M-=
jTbZmK-BlOdfPjZ8kHnmlfoPRP3o_3Oybf-lGRO4IkHiVCX5t_eLG3INmsh7cWeICneK0w3X4ny=
_0ps_E5gK1Jhd7xjDwjtlBXEbD2IhEqOE3ECu7e7draPwprFnnqvzl88fhxSuIPl6GvDxRkmSfS=
ZtvYzbrhJwCCI-7djzQmUzvCjX6yPtsr2uKGUeKJkhEyfoRjv-auU_NtPRFMjGBi8i8Iopl7vJ1=
ycfgXjbX50jGuV86qzdBXe2c3LT6Q29my2lR6Q8xBbdliaThZKDS7VEzJQra-hkASe3Z0lRph-H=
0IQOohGsraMkTh-3SDNW8KRfF9kudZLZx7edwW_NuoGlfWPsh73dlF9UUNLR4jGjiCBO9IMw&u=
=3D0&s=3D1&q=3DAN9yeQK40y89ECpd4D0jVq6P0k6QhhPdYhNC3jUzvoAAnmTHyVXZJ-CAPne0=
FzYJeKOaZoA5K4RTp5ltz283LWcDtDYU&download=3Dfalse&nonce=3Dk0eb86q2apjgq&use=
r=3D111337015573342552177&hash=3Da1st5imf9988v1874dt4b2n1as1fe6b3>
NV116WHM-A4D: NV116WHM-A4D V8.0 Teacake  Product Specification-20240416.pdf
<https://doc-2gmg-1nh0-partnerissuetracker.corp.googleusercontent.com/attac=
hments/mq0gcoa29tnq74780las1lal5ftnfoo4/n6hfpptln26j2u8dunkl1akr9r83k6mt/17=
21554200000/166959/111337015573342552177/348109270::57530824::166959?dat=3D=
AFNnbnk3XzVE8wGjqg7EpyJldfWHTWNzIFilps5xbvDPuooMkTjQCZ5sr-9nnX4K9eOZAW9po2V=
J7EVlv_13HR2FfqUELrmFk4p6kYS0K9p51TTG37MnO7ZYthz3G9VdmQ7Ej1KrKfgd53eKcVUhWW=
ntYwlIPY9bNe0VAhiv0tMtB0Lb6anzCda5nRpOto3lUkyjqWnMdM3R0BIaCJEUedoRjtcIjZS1w=
05JhvIzNbWetBxz1cxAmq36SvCfbZuUJoog_BcPu2A_GVURiemIJYHQVQ5uy12ckaeYqbAYvFOo=
oeoCJ_id7lGX0-Z_v5L7Ofmzy8qG3gowomNf1UBvb6I5CRLqyUE2Y_CQ9YzkY3AGv-GHVvOYgF6=
YTlmG3x7GQRMd1G8HhSP2x1nBJU9XfJ6o_CF6vj4F7wbwff7KmZPH10EXBuXxERLohRVU-La8s5=
a6I0QK6mga8qyRRY2cZNni3b2EgJD8IQYbsZsm5tl5h_CE0X14jtKy-h3oHiJegusij-wi2pKjW=
rYYriQysUbQ_Y24o3otEH1j2AMlR0CImxjeFF42qNWeH_RM1SDYCNmcRghUwDDCpQOjthlf3HkT=
w7TI9lKAI5VbGGcAANwCnWYNNQr9p3WI99Xtb_KN8IXSY0nXqHjEBmGoS_ydYCHVR_Je_p5hLmv=
Qjkk6GQfohdX-FTRBq2HHjKdBtuJastvT__sdKlINvO4Fwtg8gM0y9l7BPKqWgBe43yftC5w81z=
wBYiJVzhMDotvx811rDRtaMBkscZBVRDA_dAF28k5tKc7unkEaFqDyOa0Fj9fBclo3enL_yZR6X=
yzhhy6Jcvuw_Zy_2v-C_TFSaMyAx84K28DZNupwqbktXfhbNQk7fYHuNoo1QnQSu5J74-TpQPk6=
bRt4ONpsxIQ5jD8u0Rj5vrQ9Q05oxEqwfozsCuOuX_C5aB33Llg4pTI-1NxdfgsyLOnU_zRe&u=
=3D0&s=3D1&q=3DAN9yeQJu9YDdOWMkPMTDt75XeE-LZnCJSwtXDcbzZvzWXkykAeYwRk3uOWI5=
HvSUsJDLBHKgh22QFTDUnOKd81i3nFaP&download=3Dfalse&nonce=3Dcvjbf89um6me4&use=
r=3D111337015573342552177&hash=3Ds5ecvgnh059jptltquuu6n376reugrva>
N116BCA-EA2: Approval Specification N116BCA-EA2_C3_20231212.pdf
<https://doc-155g-1nh0-partnerissuetracker.corp.googleusercontent.com/attac=
hments/mq0gcoa29tnq74780las1lal5ftnfoo4/0p8ego5ge945jhe4ncrfcm5i3tgll6eb/17=
21554200000/166959/111337015573342552177/348109270::57531723::166959?dat=3D=
AFNnbnmMXfx5vHpEYrTn1TkbewAACSg9fGOjbz7fwDpSxLi4hidljz8xk-Q3LXMY4aeWAOjzIP7=
61W3nB_TfHu_YErBP7GB7ECCTg8lcnNafTYIx4mlZG6k3Ds0lkEp0dVES_ZZyl4hwdqAlhzp6EV=
IzxefaLW2KtniHl-31xbrdtqglqxbXSHEfzIAyUwJwUmyfHh3baQsfXioNHkBBSjATpVrga0k9V=
Gj3DNtYSRlOspKItcSdqCxvgffBTikPIFJbuaBsYQLVYJalwljz089cKZm4w4MylJNct59mIsli=
5p3gLgTo4sSvCkHz1NY-yHEIRVAAw8POHFSQZ3SMMTyOyD1Zo8ysqHhSMX0xUVI_VQTi8dEwz4u=
lJrEdydhtlCQqsjbPUj8EcCrSoxxFICJFfiiufrMvY2IxRvx9V4MP3mQ5hbVQgCuTe2QlRZ26P7=
Xci7RLJY_xWyCU_THu27mOoXfWGaalk-NzgZov41IETXslxih70zZYOaxwpURKuiqBRzP_Uom4K=
8a3pW8rY-LF4wH3OQGQXmC0NyepzbLfZmoA9grVpsMTSfCJLVPbWkNu9s_hea3dM4LW0M67Sx5b=
kQNTRWuSQaC4VUqWnxCf1ouQhCXMO128tlmZhVlG_sN9yNJnR_VIv9zUeiGl9M-vgCXNtRmFlXk=
wag6VTd-DTycs3mSwghhyX8pGgR8785-Z17j_1jWsPEWsqjuiiPhl4x7E54pmV1IFt-LU5m_9Kv=
0uz6gRS7djg1lf7QSDdq6rLx0s7_PCS_Zb4TLizaq8AAJrcn0Wz2EXb0rVicbs44ScF4Cc1S8uk=
mBvKUwHJbB1HsjgWjZpKwttJhGz4RS8ToVGqCxfcf7UZ9sVJYR7hKs5ylaMAR_nCiZ7Xx45cVMu=
GWP6edwq4eP_arX0Ttoto_yiQhKAL3i2pYB3IwUPoLv-Y3lBlU2Ns6puphp-RAt0PxE3WKYN&u=
=3D0&s=3D1&q=3DAN9yeQJwoiesDzhnS5k1Uaf5Q0kvGaUyH6TUhmGbJYOLj4XEk90lItEkCktT=
X-YmcKwAtoo1hJU_LbUNSXoJk5Nruri2&download=3Dfalse&nonce=3Dggvpoco4nuo1o&use=
r=3D111337015573342552177&hash=3Drmq0j29poc48dk2d9m5f5s6mf2qk18uc>
N116BCP-EA2: TFT-LCD Tentative N116BCP-EA2 C2 for HP Ver 0.2-240502.pdf
<https://doc-3480-1nh0-partnerissuetracker.corp.googleusercontent.com/attac=
hments/mq0gcoa29tnq74780las1lal5ftnfoo4/hamrhnrap5hbjsfs2m5c5abss3m7tgfa/17=
21554200000/166959/111337015573342552177/348109270::57530666::166959?dat=3D=
AFNnbnmR29YYAXp-j8-e4VW8TSMQnrMg3OzovrzXMhZuqzbzJmaXj4gY8YYroXd4Tw0E4iusxej=
QethQFEGDW9qkMgC3bFByOC0tRJIGHxjBKg6CGLUuFV4zfT8nOVaknqUZWm15LkDBvk2rQ2bVES=
pP7Vm1cZtYaafSmWnkakV-dDeR6nYoG9Oebw9NE5Hcy9JA-F6ryZvwMmmc7VRLVzPasTOMTp89p=
Kf0beYwau41hbvvzxARUg1H4VVD_jwzALRJXd1woCf4sVYHeUM7g0bgYM5l_y4L0SSBAjXg8oLH=
d9xxpXPjsrZiEQBibdDdxrbHYVBhzpI6fE8zKyOL5aEuLIXHqS5qc1WhmH3V2-xZzE0P-WSHuOy=
cULHRPvGonlk_wdxeRTiQ1oSv-bKNke315zWzP9Ka0Lnz_Sv2Sv1Jt6WbaeD40SgrQJDNgjfwhn=
EwYvH5d-9jhjd626fTnBlKGQ6puzjFumcGD3G6Oak3qRWgDm6KR6VDlfpFrkhYO3mJ-7arTxu0Y=
zie-3b2xAndyR2QzX0BeFGU0fdlT6nKnnZbQIO1zpiRwnilu2zbf0BtktXbJb5kFdMOzGZHtwFr=
ABstEn6IU5RiKEvS6YhOsOEB2HC46iZQ6rXMwW417TnfWb7wJC8wio6Ic1t-xOc7IpywNzFK3AL=
urjksCfdPR1udfrgYfL1ov6qBhe190ZhV1UQl6RhDx5yvQY0OJwBIC-fIid8Irzd4l1fTEuvvE1=
VZzK-RLgr0197QeErEQpm9N2wvK7sn0k9dVijvCAdDmS-uDztAxrdH1YT7xoFD2UgM6yzbNDxOJ=
v5wF9sOFBxF94hHn7m2ppfA9G_zZW6rhbUkXae0D-r750qqT21CS3zwKGoRBuryNDVM36z8cuNx=
T1hw0WghIlwmKzCLmSEkFSAQccEhZwK6VltLIdbfKP9zdaUCng6SXBu6chzeNWdFlmEKDEGW&u=
=3D0&s=3D1&q=3DAN9yeQJO3Gay9so_KEqKhi0DEwDZANpO1J4tOto_bJNBy3hob0iSxSabAN0p=
g0CNzjAiorXMQzcON0IU2Cl2CZsd5uco&download=3Dfalse&nonce=3Dm0pt31qdui4t0&use=
r=3D111337015573342552177&hash=3Dqvhvrjvabpmf35jrbt4i6t4lbpgihp4g>

On page 24 of the N116BCP-EA2 datasheet
<https://doc-3480-1nh0-partnerissuetracker.corp.googleusercontent.com/attac=
hments/mq0gcoa29tnq74780las1lal5ftnfoo4/hamrhnrap5hbjsfs2m5c5abss3m7tgfa/17=
21554200000/166959/111337015573342552177/348109270::57530666::166959?dat=3D=
AFNnbnmR29YYAXp-j8-e4VW8TSMQnrMg3OzovrzXMhZuqzbzJmaXj4gY8YYroXd4Tw0E4iusxej=
QethQFEGDW9qkMgC3bFByOC0tRJIGHxjBKg6CGLUuFV4zfT8nOVaknqUZWm15LkDBvk2rQ2bVES=
pP7Vm1cZtYaafSmWnkakV-dDeR6nYoG9Oebw9NE5Hcy9JA-F6ryZvwMmmc7VRLVzPasTOMTp89p=
Kf0beYwau41hbvvzxARUg1H4VVD_jwzALRJXd1woCf4sVYHeUM7g0bgYM5l_y4L0SSBAjXg8oLH=
d9xxpXPjsrZiEQBibdDdxrbHYVBhzpI6fE8zKyOL5aEuLIXHqS5qc1WhmH3V2-xZzE0P-WSHuOy=
cULHRPvGonlk_wdxeRTiQ1oSv-bKNke315zWzP9Ka0Lnz_Sv2Sv1Jt6WbaeD40SgrQJDNgjfwhn=
EwYvH5d-9jhjd626fTnBlKGQ6puzjFumcGD3G6Oak3qRWgDm6KR6VDlfpFrkhYO3mJ-7arTxu0Y=
zie-3b2xAndyR2QzX0BeFGU0fdlT6nKnnZbQIO1zpiRwnilu2zbf0BtktXbJb5kFdMOzGZHtwFr=
ABstEn6IU5RiKEvS6YhOsOEB2HC46iZQ6rXMwW417TnfWb7wJC8wio6Ic1t-xOc7IpywNzFK3AL=
urjksCfdPR1udfrgYfL1ov6qBhe190ZhV1UQl6RhDx5yvQY0OJwBIC-fIid8Irzd4l1fTEuvvE1=
VZzK-RLgr0197QeErEQpm9N2wvK7sn0k9dVijvCAdDmS-uDztAxrdH1YT7xoFD2UgM6yzbNDxOJ=
v5wF9sOFBxF94hHn7m2ppfA9G_zZW6rhbUkXae0D-r750qqT21CS3zwKGoRBuryNDVM36z8cuNx=
T1hw0WghIlwmKzCLmSEkFSAQccEhZwK6VltLIdbfKP9zdaUCng6SXBu6chzeNWdFlmEKDEGW&u=
=3D0&s=3D1&q=3DAN9yeQJO3Gay9so_KEqKhi0DEwDZANpO1J4tOto_bJNBy3hob0iSxSabAN0p=
g0CNzjAiorXMQzcON0IU2Cl2CZsd5uco&download=3Dfalse&nonce=3D49islu23tecem&use=
r=3D111337015573342552177&hash=3Deg42jri5g3bo3s92dkvnc0l2lp74252o>,
the value for t9 as disable is "null".

If I have misunderstood what you mean, please correct me.

Thank you,

On Wed, Jul 17, 2024 at 10:58=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg>
wrote:
>
> Hi,
>
> On Wed, Jul 17, 2024 at 2:39=E2=80=AFAM Terry Hsiao
> <terry_hsiao@compal.corp-partner.google.com> wrote:
> >
> > The 6 panels are used on Mediatek MT8186 Chromebooks
> > - B116XAT04.1  (06AF/B4C4)
> > - NV116WHM-A4D (09E5/FA0C)
> > - N116BCP-EA2  (0DAE/6111)
> > - B116XTN02.3  (06AF/AA73)
> > - B116XAN06.1  (06AF/99A1)
> > - N116BCA-EA2  (0DAE/5D11)
> >
> > Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> Please resend with a better patch subject, like "drm/panel-edp: Add 6
> panels used by MT8186 Chromebooks".
>
> Also: are you adding timings based on the datasheets, or are you just
> guessing here? The previous patches that added "conservative" timings
> were because the Chromebooks involved were really old and couldn't be
> tracked down and folks couldn't find the relevant datasheets. In the
> case of MT8188 I'd expect you to be adding timings based on the
> datasheets. Please confirm that you are.
>
> If possible, it's really nice to have the raw EDIDs for the panels in
> the commit message in case someone needs it later.
>
>
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c
b/drivers/gpu/drm/panel/panel-edp.c
> > index f85a6404ba58..ac280607998f 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1845,8 +1845,11 @@ static const struct edp_panel_entry edp_panels[]
=3D {
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50,
"B116XAN06.3"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50,
"B140HAK02.7"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50,
"B140XTN07.2"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50,
"B116XTN02.3"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50,
"B133UAN01.0"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50,
"B120XAN01.0"),
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50,
"B116XAN06.1"),
>
> Please keep this sorted. For instance, 0xa199 should come _before_
> 0xd497, right?
>
>
> > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50,
"B116XAT04.1"),
> >         EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50,
"B140XTN07.7"),
> >
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200,
"Unknown"),
> > @@ -1901,6 +1904,7 @@ static const struct edp_panel_entry edp_panels[]
=3D {
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80,
"NT140FHM-N47"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80,
"NT140FHM-N47"),
> >         EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200,
"NT116WHM-N44"),
> > +       EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50,
"NV116WHM-A4D"),
> >
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50,
"N116BGE-EB2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50,
"N116BGE-EA2"),
> > @@ -1916,8 +1920,10 @@ static const struct edp_panel_entry edp_panels[]
=3D {
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1156, &delay_200_500_e80_d50,
"Unknown"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50,
"N116BGE-EA2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50,
"N116BCN-EB1"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x115d, &delay_200_500_e80_d50,
"N116BCA-EA2"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50,
"N116BCA-EA1"),
> >         EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50,
"N116BCJ-EAK"),
> > +       EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80,
"N116BCP-EA2"),
>
> It looks suspicious that all the panels around this one need 50 ms for
> disable but yours doesn't. While it's certainly possible that things
> changed for this panel, it's worth double-checking.
>
> -Doug

--00000000000064672c061dbf060e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Doug,<br><br>Thank you for your reply.<br>The patch has=
 been modified and will be sent to you shortly.<br><br>The timings are set =
based on the panel datasheets in <a href=3D"https://partnerissuetracker.cor=
p.google.com/issues/348109270">IssueTracker</a><br>B116XTN02.3: <a href=3D"=
https://doc-2smg-1nh0-partnerissuetracker.corp.googleusercontent.com/attach=
ments/mq0gcoa29tnq74780las1lal5ftnfoo4/ph5qkheuqvg2fvob27asjkgq7ff33mkf/172=
1554200000/166959/111337015573342552177/348109270::57531111::166959?dat=3DA=
FNnbnkhQm7XsXxWOBuDk0VIJvUKBHdjcgGgSwwc58sMbB-fgXwwoppdVYlgxvb5E9C6k3p10IaB=
03CiVzkc1wrC7aGowJaWB8LKQtrY0WN90uO2nx1AY3alC3Dx_olx852xGfomeOWXEIcQohwsoLK=
qd4XeHvqFK2TxspYqQFONYqVbOh-8d1mndFFn_6GQjKRSIlQoNmJuhzRZiUucP5hlomcztxgBCQ=
UdD146sjIP51dC4ocbuKF126f0IFumyv-LWPT5bRfTyY26GxWpR9iCgctZXKVi8i8dfEjFakoOp=
XHUAV2gH4argtvgZeJ8ToXyEZ54MYLMwUguC7C_ksDbMfBgMg0aYmicKYNVZjLgJaTgo4vhs_Yv=
KWs2NObJCJqai-rhhYXR7kdX79hajO1ZfdUlr3Cq9uaWHvYdkjm7R_1FoNluXI0YJhFf4vNw3CJ=
MqHgaS5Mo2Ixbq7VtR-NQZNdgW5B2ZWlxBovJ97vtkKkvW1n_Yl0xIUfrjDO__gEQoYlaKwud0o=
5lZG8wIDqD30AmVvg7LdQp1uGufdwqw3N2DISsabokWWNzkuP0qJK77ZJP3cDsssxwUvrrcPZRe=
kgHP1V4sFrH0fshaeGF8DRX2Bhauxg6NsuZ_U_NhWqWYetxaG8XGk8m0xFGgxe3iMg2FQf5Z5tW=
xm6g4nlpugr6dp_oC0OidR2ouR_Rc3WkTpUZjMoEb5S9l7kpWOscgxWv8JWqtPrQo8xqvPooENC=
jhUlm0owlbLjmSggoa8PHtf5x-LdoQQeIjK2arIzkUlvkYzX1kiWEsx9Y1L0kPHSrYSWMziV4Us=
uz9R-kcpP_Es4_weQtXeVhj7z7Yq7eA9G-Y16GuOYGQk6VNjDflb-fCejHupqMNisorVv3NvE8K=
L85Gd0tf6zbkSubjbBIW-QOx1kuw5ln6yxgrIawv9wyNhdDpVgylIXWpzGhv65ONC_DhzJ2&amp=
;u=3D0&amp;s=3D1&amp;q=3DAN9yeQIX-hB1AG6zTB8bPveFC7EV1leXl8SkDXJr0Tka6ycIjW=
X8ZwTjeESrXm50JZpXwyJ9xR_alpiPkDDtf8jBIfQG&amp;download=3Dfalse&amp;nonce=
=3Ddo5hecj5bo25m&amp;user=3D111337015573342552177&amp;hash=3D1lol0e27ank5bl=
898i6qdjckn21f5dmj">B116XTN02.3(HW 9A)_HP_ Functional Spec_0617Y24.pdf</a><=
br>B116XAN06.1: <a href=3D"https://doc-1b40-1nh0-partnerissuetracker.corp.g=
oogleusercontent.com/attachments/mq0gcoa29tnq74780las1lal5ftnfoo4/3pivkjc9v=
kais9l7gdh7hu01s0ltt72f/1721554200000/166959/111337015573342552177/34810927=
0::57531255::166959?dat=3DAFNnbnkUmg9pDZRA9YoNk_ndYM2GLak1BqkRj5pcgSjYp4pux=
XniZsWfrsHq3sLgfVVIFoEg_DH53n_qYSZLXMLyZ_kKWiIEr4mkTwy-Nfsno2wJnh3toGGngKVF=
fEzkPuIAAa61iF9Myhp9nrHeAjOAn6UoQ-CQ8vtWDYe1kq_O5OfryergDK6KCzTUq3WmifCWRPk=
RKbgeIHjyns0bjsfU5hzP6G7ie3qWgX-QKkOR5zMafKyC62bfV-Xkty9jSH3NTcWzQN8IAyjQ5N=
1wbzJZhlIL0AkpGoyXr2loBVdd7XSRxInZVEh_8ZgRte-woLWc-oQ8I5WdW0dDxx2yR8hQj1Q83=
A5BuvD-T95MgKbLdHQOhUdAbE6Jh276yrYyyH0KjnTKqg-pPI3fzy8GR3j_jv9eXAtdWIcARu-T=
9VmYd7rCJVwO8fa9xO1NS33p8ujJGBuKcC5ITB98QM_fhRAxdxe74GElO7njScL9_9bUckDJ6xL=
sXFbDX-69AXiONbZcO0QPA2Tx04YguWsfvZOY7EWRufAWFlAidHoAh9-YFNd3_GOtsBl_jqcIhO=
I615OOLkzl22OdaGBvrFWMoj5WxKKtyRh4AuCc2f99Q_HB8OElVLgQKF6Wf7eDieptAXsakmhOX=
LNRsC9qfDVQ2Fh8h0G0lnQrpA4-DJPCrnM6qynsmz80QTGQnWfflDpjYlIaK5chFfoGmAaQnjN6=
rxJyeofVi9dprKo4Cjw3xJ-Isi42vUQOA_1sJO4NT-kxEvjbYB5TqpuxuaaKkmzNCDrRXXO0AKv=
In3_vb8P1r1eq2-Vxt-7flOiQ6AbwldWWfZ3S9uszCeWKNFtK4lkRV-pAPdAJDYutbL84w9Uipj=
i9hNOtDia_jwkdBrjH-QzD2ISWHIt7EzezbmqiPYXAMeU4tfGJJAmQQrpcRKOactpapo0apVhXd=
YluYhCjqB2I6cW6V7kn53Ht&amp;u=3D0&amp;s=3D1&amp;q=3DAN9yeQLR46gJqnFjKut6daG=
6FK9bPPkFA6UiSw9FXbX5fsaXkmXP3js1BJI6-f8AbJw8ZREFc3t6pLIaZrEIKWg6IDkTdg&amp=
;download=3Dfalse&amp;nonce=3D17mgmbgh7m0qo&amp;user=3D11133701557334255217=
7&amp;hash=3Dfvo5saidhnnoaguhotrrdoks4p9hr7on">B116XAN06.1_7A_HP_ Final Fun=
ctional Spec 0617Y24.pdf</a><br>B116XAT04.1: <a href=3D"https://doc-1n3g-1n=
h0-partnerissuetracker.corp.googleusercontent.com/attachments/mq0gcoa29tnq7=
4780las1lal5ftnfoo4/kkfplq8r6vhahkjuc1js66u5numr1eul/1721554200000/166959/1=
11337015573342552177/348109270::57530823::166959?dat=3DAFNnbnmccGFOEK92PhWw=
CnzNpc5fH7G5B1UQXPHMMhgoMf1wVeG68KWmrAb4o27LDwYNh6yHA_Wmu38TFh2ODaMa0IT85xF=
sp-8NpJpevs-nx4VD_BUPxw58L-L3sUSNSXBSyMTWYdssWtTVppJOxVmtK-kiKrT5Wz_YkOmbkj=
Z3RqxZqLgyviPvQwZbY5ZRkgeCSlciGktstztQbLqTikOMKC-nh4PtyTLWEwVk9OlVG2KB_X0a1=
VE6tydN37ggCrFtpolC4IhxVcAtDPmr-1nDyHMuL1vGlNCY6-KVPzkXdedspzYhaU80L2_-veVL=
XIq8tRTRPpLODBJLuDfw4wIY2GYzG-pq1y_pxjDXM0K8SShk2ClSAN4yUnPI3IsdJXMXwpK1CeP=
g7hXhoOtxj9CzWiZYznuR_NinVKpMBK41VBrl8uJZ2p6tiYVhyHXXNg1h5PGO8OMymfb_Q5ed_2=
Wt1_4qjG70NA0jNCySFrfIZd3J1n5BXO0GDX-6khETkXl6uEsv3I8PJDofcP8oABShAQHZrd9Wj=
oavJLEu4fm6c0fUXwLNZNUFYaJE4Ve4JyQb209XQI5oGiw9qpnPE7M-jTbZmK-BlOdfPjZ8kHnm=
lfoPRP3o_3Oybf-lGRO4IkHiVCX5t_eLG3INmsh7cWeICneK0w3X4ny_0ps_E5gK1Jhd7xjDwjt=
lBXEbD2IhEqOE3ECu7e7draPwprFnnqvzl88fhxSuIPl6GvDxRkmSfSZtvYzbrhJwCCI-7djzQm=
UzvCjX6yPtsr2uKGUeKJkhEyfoRjv-auU_NtPRFMjGBi8i8Iopl7vJ1ycfgXjbX50jGuV86qzdB=
Xe2c3LT6Q29my2lR6Q8xBbdliaThZKDS7VEzJQra-hkASe3Z0lRph-H0IQOohGsraMkTh-3SDNW=
8KRfF9kudZLZx7edwW_NuoGlfWPsh73dlF9UUNLR4jGjiCBO9IMw&amp;u=3D0&amp;s=3D1&am=
p;q=3DAN9yeQK40y89ECpd4D0jVq6P0k6QhhPdYhNC3jUzvoAAnmTHyVXZJ-CAPne0FzYJeKOaZ=
oA5K4RTp5ltz283LWcDtDYU&amp;download=3Dfalse&amp;nonce=3Dk0eb86q2apjgq&amp;=
user=3D111337015573342552177&amp;hash=3Da1st5imf9988v1874dt4b2n1as1fe6b3">B=
116XAT04.1 HW 0 A(HH)_ Pre Functional Spec_HP_ 0425Y24.pdf</a><br>NV116WHM-=
A4D: <a href=3D"https://doc-2gmg-1nh0-partnerissuetracker.corp.googleuserco=
ntent.com/attachments/mq0gcoa29tnq74780las1lal5ftnfoo4/n6hfpptln26j2u8dunkl=
1akr9r83k6mt/1721554200000/166959/111337015573342552177/348109270::57530824=
::166959?dat=3DAFNnbnk3XzVE8wGjqg7EpyJldfWHTWNzIFilps5xbvDPuooMkTjQCZ5sr-9n=
nX4K9eOZAW9po2VJ7EVlv_13HR2FfqUELrmFk4p6kYS0K9p51TTG37MnO7ZYthz3G9VdmQ7Ej1K=
rKfgd53eKcVUhWWntYwlIPY9bNe0VAhiv0tMtB0Lb6anzCda5nRpOto3lUkyjqWnMdM3R0BIaCJ=
EUedoRjtcIjZS1w05JhvIzNbWetBxz1cxAmq36SvCfbZuUJoog_BcPu2A_GVURiemIJYHQVQ5uy=
12ckaeYqbAYvFOooeoCJ_id7lGX0-Z_v5L7Ofmzy8qG3gowomNf1UBvb6I5CRLqyUE2Y_CQ9Yzk=
Y3AGv-GHVvOYgF6YTlmG3x7GQRMd1G8HhSP2x1nBJU9XfJ6o_CF6vj4F7wbwff7KmZPH10EXBuX=
xERLohRVU-La8s5a6I0QK6mga8qyRRY2cZNni3b2EgJD8IQYbsZsm5tl5h_CE0X14jtKy-h3oHi=
Jegusij-wi2pKjWrYYriQysUbQ_Y24o3otEH1j2AMlR0CImxjeFF42qNWeH_RM1SDYCNmcRghUw=
DDCpQOjthlf3HkTw7TI9lKAI5VbGGcAANwCnWYNNQr9p3WI99Xtb_KN8IXSY0nXqHjEBmGoS_yd=
YCHVR_Je_p5hLmvQjkk6GQfohdX-FTRBq2HHjKdBtuJastvT__sdKlINvO4Fwtg8gM0y9l7BPKq=
WgBe43yftC5w81zwBYiJVzhMDotvx811rDRtaMBkscZBVRDA_dAF28k5tKc7unkEaFqDyOa0Fj9=
fBclo3enL_yZR6Xyzhhy6Jcvuw_Zy_2v-C_TFSaMyAx84K28DZNupwqbktXfhbNQk7fYHuNoo1Q=
nQSu5J74-TpQPk6bRt4ONpsxIQ5jD8u0Rj5vrQ9Q05oxEqwfozsCuOuX_C5aB33Llg4pTI-1Nxd=
fgsyLOnU_zRe&amp;u=3D0&amp;s=3D1&amp;q=3DAN9yeQJu9YDdOWMkPMTDt75XeE-LZnCJSw=
tXDcbzZvzWXkykAeYwRk3uOWI5HvSUsJDLBHKgh22QFTDUnOKd81i3nFaP&amp;download=3Df=
alse&amp;nonce=3Dcvjbf89um6me4&amp;user=3D111337015573342552177&amp;hash=3D=
s5ecvgnh059jptltquuu6n376reugrva">NV116WHM-A4D V8.0 Teacake =C2=A0Product S=
pecification-20240416.pdf</a><br>N116BCA-EA2: <a href=3D"https://doc-155g-1=
nh0-partnerissuetracker.corp.googleusercontent.com/attachments/mq0gcoa29tnq=
74780las1lal5ftnfoo4/0p8ego5ge945jhe4ncrfcm5i3tgll6eb/1721554200000/166959/=
111337015573342552177/348109270::57531723::166959?dat=3DAFNnbnmMXfx5vHpEYrT=
n1TkbewAACSg9fGOjbz7fwDpSxLi4hidljz8xk-Q3LXMY4aeWAOjzIP761W3nB_TfHu_YErBP7G=
B7ECCTg8lcnNafTYIx4mlZG6k3Ds0lkEp0dVES_ZZyl4hwdqAlhzp6EVIzxefaLW2KtniHl-31x=
brdtqglqxbXSHEfzIAyUwJwUmyfHh3baQsfXioNHkBBSjATpVrga0k9VGj3DNtYSRlOspKItcSd=
qCxvgffBTikPIFJbuaBsYQLVYJalwljz089cKZm4w4MylJNct59mIsli5p3gLgTo4sSvCkHz1NY=
-yHEIRVAAw8POHFSQZ3SMMTyOyD1Zo8ysqHhSMX0xUVI_VQTi8dEwz4ulJrEdydhtlCQqsjbPUj=
8EcCrSoxxFICJFfiiufrMvY2IxRvx9V4MP3mQ5hbVQgCuTe2QlRZ26P7Xci7RLJY_xWyCU_THu2=
7mOoXfWGaalk-NzgZov41IETXslxih70zZYOaxwpURKuiqBRzP_Uom4K8a3pW8rY-LF4wH3OQGQ=
XmC0NyepzbLfZmoA9grVpsMTSfCJLVPbWkNu9s_hea3dM4LW0M67Sx5bkQNTRWuSQaC4VUqWnxC=
f1ouQhCXMO128tlmZhVlG_sN9yNJnR_VIv9zUeiGl9M-vgCXNtRmFlXkwag6VTd-DTycs3mSwgh=
hyX8pGgR8785-Z17j_1jWsPEWsqjuiiPhl4x7E54pmV1IFt-LU5m_9Kv0uz6gRS7djg1lf7QSDd=
q6rLx0s7_PCS_Zb4TLizaq8AAJrcn0Wz2EXb0rVicbs44ScF4Cc1S8ukmBvKUwHJbB1HsjgWjZp=
KwttJhGz4RS8ToVGqCxfcf7UZ9sVJYR7hKs5ylaMAR_nCiZ7Xx45cVMuGWP6edwq4eP_arX0Tto=
to_yiQhKAL3i2pYB3IwUPoLv-Y3lBlU2Ns6puphp-RAt0PxE3WKYN&amp;u=3D0&amp;s=3D1&a=
mp;q=3DAN9yeQJwoiesDzhnS5k1Uaf5Q0kvGaUyH6TUhmGbJYOLj4XEk90lItEkCktTX-YmcKwA=
too1hJU_LbUNSXoJk5Nruri2&amp;download=3Dfalse&amp;nonce=3Dggvpoco4nuo1o&amp=
;user=3D111337015573342552177&amp;hash=3Drmq0j29poc48dk2d9m5f5s6mf2qk18uc">=
Approval Specification N116BCA-EA2_C3_20231212.pdf</a><div>N116BCP-EA2:=C2=
=A0<a href=3D"https://doc-3480-1nh0-partnerissuetracker.corp.googleusercont=
ent.com/attachments/mq0gcoa29tnq74780las1lal5ftnfoo4/hamrhnrap5hbjsfs2m5c5a=
bss3m7tgfa/1721554200000/166959/111337015573342552177/348109270::57530666::=
166959?dat=3DAFNnbnmR29YYAXp-j8-e4VW8TSMQnrMg3OzovrzXMhZuqzbzJmaXj4gY8YYroX=
d4Tw0E4iusxejQethQFEGDW9qkMgC3bFByOC0tRJIGHxjBKg6CGLUuFV4zfT8nOVaknqUZWm15L=
kDBvk2rQ2bVESpP7Vm1cZtYaafSmWnkakV-dDeR6nYoG9Oebw9NE5Hcy9JA-F6ryZvwMmmc7VRL=
VzPasTOMTp89pKf0beYwau41hbvvzxARUg1H4VVD_jwzALRJXd1woCf4sVYHeUM7g0bgYM5l_y4=
L0SSBAjXg8oLHd9xxpXPjsrZiEQBibdDdxrbHYVBhzpI6fE8zKyOL5aEuLIXHqS5qc1WhmH3V2-=
xZzE0P-WSHuOycULHRPvGonlk_wdxeRTiQ1oSv-bKNke315zWzP9Ka0Lnz_Sv2Sv1Jt6WbaeD40=
SgrQJDNgjfwhnEwYvH5d-9jhjd626fTnBlKGQ6puzjFumcGD3G6Oak3qRWgDm6KR6VDlfpFrkhY=
O3mJ-7arTxu0Yzie-3b2xAndyR2QzX0BeFGU0fdlT6nKnnZbQIO1zpiRwnilu2zbf0BtktXbJb5=
kFdMOzGZHtwFrABstEn6IU5RiKEvS6YhOsOEB2HC46iZQ6rXMwW417TnfWb7wJC8wio6Ic1t-xO=
c7IpywNzFK3ALurjksCfdPR1udfrgYfL1ov6qBhe190ZhV1UQl6RhDx5yvQY0OJwBIC-fIid8Ir=
zd4l1fTEuvvE1VZzK-RLgr0197QeErEQpm9N2wvK7sn0k9dVijvCAdDmS-uDztAxrdH1YT7xoFD=
2UgM6yzbNDxOJv5wF9sOFBxF94hHn7m2ppfA9G_zZW6rhbUkXae0D-r750qqT21CS3zwKGoRBur=
yNDVM36z8cuNxT1hw0WghIlwmKzCLmSEkFSAQccEhZwK6VltLIdbfKP9zdaUCng6SXBu6chzeNW=
dFlmEKDEGW&amp;u=3D0&amp;s=3D1&amp;q=3DAN9yeQJO3Gay9so_KEqKhi0DEwDZANpO1J4t=
Oto_bJNBy3hob0iSxSabAN0pg0CNzjAiorXMQzcON0IU2Cl2CZsd5uco&amp;download=3Dfal=
se&amp;nonce=3Dm0pt31qdui4t0&amp;user=3D111337015573342552177&amp;hash=3Dqv=
hvrjvabpmf35jrbt4i6t4lbpgihp4g">TFT-LCD Tentative N116BCP-EA2 C2 for HP Ver=
 0.2-240502.pdf</a></div><div><br></div><div>On page 24 of the N116BCP-EA2=
=C2=A0<a href=3D"https://doc-3480-1nh0-partnerissuetracker.corp.googleuserc=
ontent.com/attachments/mq0gcoa29tnq74780las1lal5ftnfoo4/hamrhnrap5hbjsfs2m5=
c5abss3m7tgfa/1721554200000/166959/111337015573342552177/348109270::5753066=
6::166959?dat=3DAFNnbnmR29YYAXp-j8-e4VW8TSMQnrMg3OzovrzXMhZuqzbzJmaXj4gY8YY=
roXd4Tw0E4iusxejQethQFEGDW9qkMgC3bFByOC0tRJIGHxjBKg6CGLUuFV4zfT8nOVaknqUZWm=
15LkDBvk2rQ2bVESpP7Vm1cZtYaafSmWnkakV-dDeR6nYoG9Oebw9NE5Hcy9JA-F6ryZvwMmmc7=
VRLVzPasTOMTp89pKf0beYwau41hbvvzxARUg1H4VVD_jwzALRJXd1woCf4sVYHeUM7g0bgYM5l=
_y4L0SSBAjXg8oLHd9xxpXPjsrZiEQBibdDdxrbHYVBhzpI6fE8zKyOL5aEuLIXHqS5qc1WhmH3=
V2-xZzE0P-WSHuOycULHRPvGonlk_wdxeRTiQ1oSv-bKNke315zWzP9Ka0Lnz_Sv2Sv1Jt6Wbae=
D40SgrQJDNgjfwhnEwYvH5d-9jhjd626fTnBlKGQ6puzjFumcGD3G6Oak3qRWgDm6KR6VDlfpFr=
khYO3mJ-7arTxu0Yzie-3b2xAndyR2QzX0BeFGU0fdlT6nKnnZbQIO1zpiRwnilu2zbf0BtktXb=
Jb5kFdMOzGZHtwFrABstEn6IU5RiKEvS6YhOsOEB2HC46iZQ6rXMwW417TnfWb7wJC8wio6Ic1t=
-xOc7IpywNzFK3ALurjksCfdPR1udfrgYfL1ov6qBhe190ZhV1UQl6RhDx5yvQY0OJwBIC-fIid=
8Irzd4l1fTEuvvE1VZzK-RLgr0197QeErEQpm9N2wvK7sn0k9dVijvCAdDmS-uDztAxrdH1YT7x=
oFD2UgM6yzbNDxOJv5wF9sOFBxF94hHn7m2ppfA9G_zZW6rhbUkXae0D-r750qqT21CS3zwKGoR=
BuryNDVM36z8cuNxT1hw0WghIlwmKzCLmSEkFSAQccEhZwK6VltLIdbfKP9zdaUCng6SXBu6chz=
eNWdFlmEKDEGW&amp;u=3D0&amp;s=3D1&amp;q=3DAN9yeQJO3Gay9so_KEqKhi0DEwDZANpO1=
J4tOto_bJNBy3hob0iSxSabAN0pg0CNzjAiorXMQzcON0IU2Cl2CZsd5uco&amp;download=3D=
false&amp;nonce=3D49islu23tecem&amp;user=3D111337015573342552177&amp;hash=
=3Deg42jri5g3bo3s92dkvnc0l2lp74252o">datasheet</a>, the value for t9 as dis=
able=C2=A0is &quot;null&quot;.=C2=A0</div><div><br></div><div>If I have mis=
understood what you mean, please correct me.</div><div><br></div><div>Thank=
 you,<br></div><div><br>On Wed, Jul 17, 2024 at 10:58=E2=80=AFPM Doug Ander=
son &lt;<a href=3D"mailto:dianders@chromium.org">dianders@chromium.org</a>&=
gt; wrote:<br>&gt;<br>&gt; Hi,<br>&gt;<br>&gt; On Wed, Jul 17, 2024 at 2:39=
=E2=80=AFAM Terry Hsiao<br>&gt; &lt;<a href=3D"mailto:terry_hsiao@compal.co=
rp-partner.google.com">terry_hsiao@compal.corp-partner.google.com</a>&gt; w=
rote:<br>&gt; &gt;<br>&gt; &gt; The 6 panels are used on Mediatek MT8186 Ch=
romebooks<br>&gt; &gt; - B116XAT04.1 =C2=A0(06AF/B4C4)<br>&gt; &gt; - NV116=
WHM-A4D (09E5/FA0C)<br>&gt; &gt; - N116BCP-EA2 =C2=A0(0DAE/6111)<br>&gt; &g=
t; - B116XTN02.3 =C2=A0(06AF/AA73)<br>&gt; &gt; - B116XAN06.1 =C2=A0(06AF/9=
9A1)<br>&gt; &gt; - N116BCA-EA2 =C2=A0(0DAE/5D11)<br>&gt; &gt;<br>&gt; &gt;=
 Signed-off-by: Terry Hsiao &lt;<a href=3D"mailto:terry_hsiao@compal.corp-p=
artner.google.com">terry_hsiao@compal.corp-partner.google.com</a>&gt;<br>&g=
t; &gt; ---<br>&gt; &gt; =C2=A0drivers/gpu/drm/panel/panel-edp.c | 6 ++++++=
<br>&gt; &gt; =C2=A01 file changed, 6 insertions(+)<br>&gt;<br>&gt; Please =
resend with a better patch subject, like &quot;drm/panel-edp: Add 6<br>&gt;=
 panels used by MT8186 Chromebooks&quot;.<br>&gt;<br>&gt; Also: are you add=
ing timings based on the datasheets, or are you just<br>&gt; guessing here?=
 The previous patches that added &quot;conservative&quot; timings<br>&gt; w=
ere because the Chromebooks involved were really old and couldn&#39;t be<br=
>&gt; tracked down and folks couldn&#39;t find the relevant datasheets. In =
the<br>&gt; case of MT8188 I&#39;d expect you to be adding timings based on=
 the<br>&gt; datasheets. Please confirm that you are.<br>&gt;<br>&gt; If po=
ssible, it&#39;s really nice to have the raw EDIDs for the panels in<br>&gt=
; the commit message in case someone needs it later.<br>&gt;<br>&gt;<br>&gt=
; &gt; diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/pan=
el/panel-edp.c<br>&gt; &gt; index f85a6404ba58..ac280607998f 100644<br>&gt;=
 &gt; --- a/drivers/gpu/drm/panel/panel-edp.c<br>&gt; &gt; +++ b/drivers/gp=
u/drm/panel/panel-edp.c<br>&gt; &gt; @@ -1845,8 +1845,11 @@ static const st=
ruct edp_panel_entry edp_panels[] =3D {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;, 0x635c, &amp;=
delay_200_500_e50, &quot;B116XAN06.3&quot;),<br>&gt; &gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;, 0x639c, &=
amp;delay_200_500_e50, &quot;B140HAK02.7&quot;),<br>&gt; &gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;, 0x723=
c, &amp;delay_200_500_e50, &quot;B140XTN07.2&quot;),<br>&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;, 0x73aa=
, &amp;delay_200_500_e50, &quot;B116XTN02.3&quot;),<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;, 0x=
8594, &amp;delay_200_500_e50, &quot;B133UAN01.0&quot;),<br>&gt; &gt; =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;=
, 0xd497, &amp;delay_200_500_e50, &quot;B120XAN01.0&quot;),<br>&gt; &gt; + =
=C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;,=
 0xa199, &amp;delay_200_500_e50, &quot;B116XAN06.1&quot;),<br>&gt;<br>&gt; =
Please keep this sorted. For instance, 0xa199 should come _before_<br>&gt; =
0xd497, right?<br>&gt;<br>&gt;<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 EDP_PANE=
L_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;, 0xc4b4, &amp;delay_200_500_e=
50, &quot;B116XAT04.1&quot;),<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_=
PANEL_ENTRY(&#39;A&#39;, &#39;U&#39;, &#39;O&#39;, 0xf390, &amp;delay_200_5=
00_e50, &quot;B140XTN07.7&quot;),<br>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;B&#39;, &#39;O&#39;, &#39;E&#39;, 0x0607=
, &amp;delay_200_500_e200, &quot;Unknown&quot;),<br>&gt; &gt; @@ -1901,6 +1=
904,7 @@ static const struct edp_panel_entry edp_panels[] =3D {<br>&gt; &gt=
; =C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;B&#39;, &#39;O&#39;, &#3=
9;E&#39;, 0x0b56, &amp;delay_200_500_e80, &quot;NT140FHM-N47&quot;),<br>&gt=
; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;B&#39;, &#39;O&#39;=
, &#39;E&#39;, 0x0c20, &amp;delay_200_500_e80, &quot;NT140FHM-N47&quot;),<b=
r>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;B&#39;, &#39;O=
&#39;, &#39;E&#39;, 0x0cb6, &amp;delay_200_500_e200, &quot;NT116WHM-N44&quo=
t;),<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;B&#39;, &#39;=
O&#39;, &#39;E&#39;, 0x0cfa, &amp;delay_200_500_e50, &quot;NV116WHM-A4D&quo=
t;),<br>&gt; &gt;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(=
&#39;C&#39;, &#39;M&#39;, &#39;N&#39;, 0x1130, &amp;delay_200_500_e50, &quo=
t;N116BGE-EB2&quot;),<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_EN=
TRY(&#39;C&#39;, &#39;M&#39;, &#39;N&#39;, 0x1132, &amp;delay_200_500_e80_d=
50, &quot;N116BGE-EA2&quot;),<br>&gt; &gt; @@ -1916,8 +1920,10 @@ static co=
nst struct edp_panel_entry edp_panels[] =3D {<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;M&#39;, &#39;N&#39;, 0x1156=
, &amp;delay_200_500_e80_d50, &quot;Unknown&quot;),<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;M&#39;, &#39;N&#39;, 0x=
1157, &amp;delay_200_500_e80_d50, &quot;N116BGE-EA2&quot;),<br>&gt; &gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;M&#39;, &#39;=
N&#39;, 0x115b, &amp;delay_200_500_e80_d50, &quot;N116BCN-EB1&quot;),<br>&g=
t; &gt; + =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;M&#39;, &#=
39;N&#39;, 0x115d, &amp;delay_200_500_e80_d50, &quot;N116BCA-EA2&quot;),<br=
>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;, &#39;M&=
#39;, &#39;N&#39;, 0x115e, &amp;delay_200_500_e80_d50, &quot;N116BCA-EA1&qu=
ot;),<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#39;,=
 &#39;M&#39;, &#39;N&#39;, 0x1160, &amp;delay_200_500_e80_d50, &quot;N116BC=
J-EAK&quot;),<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 EDP_PANEL_ENTRY(&#39;C&#3=
9;, &#39;M&#39;, &#39;N&#39;, 0x1161, &amp;delay_200_500_e80, &quot;N116BCP=
-EA2&quot;),<br>&gt;<br>&gt; It looks suspicious that all the panels around=
 this one need 50 ms for<br>&gt; disable but yours doesn&#39;t. While it&#3=
9;s certainly possible that things<br>&gt; changed for this panel, it&#39;s=
 worth double-checking.<br>&gt;<br>&gt; -Doug</div></div>

--00000000000064672c061dbf060e--
